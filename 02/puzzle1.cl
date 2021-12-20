(defconstant file (open "./input.txt" :if-does-not-exist nil))
(defvar pos 0)
(defvar depth 0)
(defun forward (n) (setf pos (+ pos n)))
(defun down (n) (setf depth (+ depth n)))
(defun up (n) (setf depth (- depth n)))
(defun evaline (line) (and line 
	(eval (read-from-string 
		(concatenate 'string "("
			line ")")))
))
(loop while (evaline (read-line file nil)))
(close file)
(print (* pos depth))
(exit)
