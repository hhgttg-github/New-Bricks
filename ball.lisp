
(defun set-ball-dxy (d)
  (let ((v (nth d *dir-vector*)))
    (set-sprite-dxy *ball*
		    (round (* (car v) *ball-speed*))
		    (round (* (cadr v) *ball-speed*)))))

(defun with-init-ball ()
  (set-ball-dxy *ball-direction*))
