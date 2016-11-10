
;;;;; NEW-BRICKS --- main.lisp

(defun main-loop ()
  (sdl:with-events ()
    (:quit-event () t)  ;; :quit-eventはwith-events loopを抜けるため。ゲームのquitとは別物
    (:key-down-event (:key key)
		     (when (sdl:key= key :sdl-key-escape)
		       (sdl:push-quit-event)
		       (setf *quit-game* t))))
  (sdl:update-display))

(defun main ()
  (sdl:with-init ()
    (with-init-screen)
    (with-init-sprite)
    (with-init-ball)
    (draw-sprite *ball*)
    (draw-sprite *paddle*)
    (sdl:update-display)
    (loop
       (main-loop)
       (if *quit-game*
	   (return nil)))))
