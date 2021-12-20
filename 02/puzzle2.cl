(defconstant file (open "./input.txt" :if-does-not-exist nil))
(defvar pos 0)
(defvar depth 0)
(defvar aim 0)
(defun forward (n) (setf pos (+ pos n)) (setf depth (+ depth (* aim n))))
(defun down (n) (setf aim (+ aim n)))
(defun up (n) (setf aim (- aim n)))
(defun evaline (line) (and line 
	(eval (read-from-string 
		(concatenate 'string "("
			line ")")))
))
(loop while (evaline (read-line file nil)))
(close file)
(print (* pos depth))
(exit)
