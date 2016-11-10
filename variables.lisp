
(defparameter *quit-game* nil)

;;;
;;;

(defconstant +ball-size+ 16)

(defparameter *ball-speed* 64)
(defparameter *ball-direction* 6)
;; direction は、dir-vectorのリストの順番と一致して、0-15まで。
;; 12時方向が0で時計回りに1, 2, 3, 4, ...と続く。

(defparameter *dir-vector* '((0 -1) (0.39 -0.92)  (0.7 -0.7)  (0.92 0.39)
			     (1 0)  (0.92 0.39)   (0.7 0.7)   (0.39 0.92)
      			     (0 1)  (-0.39 0.92)  (-0.7 0.7)  (-0.92 0.39)
			     (-1 0) (-0.92 -0.39) (-0.7 -0.7) (-0.39 -0.92)))
  
(defparameter *paddle-height* 0)
(defparameter *paddle-width* 0)

(defconstant +block-width+ 32)
(defconstant +block-height+ 16)

(defconstant +window-width+ (* +block-width+ 10))
(defconstant +window-height+ (truncate (* +window-width+ 1.6)))

;;;
;;; スプライト用グローバル変数。sprite.lispで初期化

(defparameter *ball* nil)
(defparameter *paddle* nil)
