;;;;;
;;;;; スプライト用ユーティリティ
;;;;;

;;;
;;; ピクセルと仮想座標の変換
;;; １ピクセルあたり仮想座標で64
;;; to-pixel で 1/64にする (ash x -5)
;;; to-point で x64にする  (ash x +5)

(defconstant per-pixel 64)
(defmacro to-pixel (x)
  `(ash ,x -5))

(defmacro to-point (x)
  `(ash ,x 5))

;;;
;;; rectを(dx,dy)に移動したrectを返す

(defun move-rect-to-* (rect dx dy)
  (sdl:set-rectangle-* rect
		       :x (+ (sdl:x rect) dx)
		       :y (+ (sdl:y rect) dy)
		       :w (sdl:width rect)
		       :h (sdl:height rect)))

;;;
;;; スプライトの仮想座標を、image-rectを使って更新。

(defun update-sprite (s)
  (setf (sdl:x (sprite-current s)) (to-point (sdl:x (sprite-image-rect s))))
  (setf (sdl:y (sprite-current s)) (to-point (sdl:y (sprite-image-rect s))))
  (setf (sprite-next s) (move-rect-to-* (sprite-current s)
					(sprite-dx s)
					(sprite-dy s))))
  
;;;
;;; スプライトをピクセル座標 (x, y)に設定する。
;;; current, next もそれに伴って更新。

(defun set-sprite-xy (s x y)
  (setf (sdl:x (sprite-image-rect s)) x)
  (setf (sdl:y (sprite-image-rect s)) y)
  (update-sprite s))

;;;
;;; スプライトの移動量 (dx, dy) を設定する。
;;; nextも同時に更新。

(defun set-sprite-dxy (s dx dy)
  (setf (sprite-dx s) dx)
  (setf (sprite-dy s) dy)
  (setf (sprite-next s) (move-rect-to-* (sprite-current s) dx dy)))

;;;;
;;;;　スプライト定義 & コンストラクター

(defstruct sprite
  image
  image-rect
  current
  next
  dx
  dy)

(defun create-sprite (image-filename &key (x 0) (y 0))

  " x, y          = ピクセルで指定すること。以下のスロットは自動で決定・更新される。
    image         = 画像イメージ
    image-rect    = 画像イメージの表示領域。ピクセル単位。
    current       = スプライトの仮想座標上の領域。ピクセルx1024の仮想座標単位
    next          = 移動後の仮想座標上の領域。
    dx, dy        = スプライトの移動量。仮想座標単位(ピクセルx1024)だが、初期値は強制的に0になる。 

    イメージはBMPのみ。(load-image :image-type :png....)などで別の形式を使用するときは
    lispbuilder-sdl-imageが必要"

  (let* ((img (sdl:convert-to-display-format :surface (sdl:load-image image-filename)
					     :enable-alpha t
					     :pixel-alpha t))
	 ;rectはピクセル領域
	 (rect (sdl:rectangle :x x
			      :y y
			      :w (sdl:width img)
			      :h (sdl:height img)))
	 ;convertedは仮想座標領域
	 (converted (sdl:rectangle :x (to-point x)
				   :y (to-point y)
				   :w (to-point (sdl:width rect))
				   :h (to-point (sdl:height rect)))))
    (make-sprite
     :image      img
     :image-rect rect
     :current    converted
     :next       converted
     :dx         0
     :dy         0)))

;;;
;;; スプライト描画

(defun draw-sprite (s)
  (sdl:draw-surface-at-* (sprite-image s)
			 (sdl:x (sprite-image-rect s))
			 (sdl:y (sprite-image-rect s))))
				
;;;
;;; スプライト用初期化

(defun with-init-sprite ()
  (setf *ball* (create-sprite "./pictures/grayball16x16.bmp"))

  (setf *paddle* (create-sprite "./pictures/bar64x16.bmp"))
  (setf *paddle-width* (sdl:width (sprite-image-rect *paddle*)))
  (setf *paddle-height* (sdl:height (sprite-image-rect *paddle*)))

  (set-sprite-xy *paddle*
		 (ash (- +window-width+ *paddle-width*) -1)
		 (- +window-height+ *paddle-height*)))
