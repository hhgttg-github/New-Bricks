
(defun with-init-screen ()
  (sdl:window +window-width+
	      +window-height+)
  (sdl:fill-surface sdl:*white* :surface sdl:*default-display*)
  (setf (sdl:frame-rate) 60)

  (sdl:update-display))
