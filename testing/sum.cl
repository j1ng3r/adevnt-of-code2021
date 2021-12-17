(defun sum (L)
	(if L
		(+ (car L) (sum (cdr L)))
		0
	)
)

(defun bool (B) (if B T ()))
(defun null (B) (if B () T))
(defun null (B) (not (bool B)))
