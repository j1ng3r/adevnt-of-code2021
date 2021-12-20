(defun read-lines (fd)
	(let ((line (read-line fd nil)))
		(and line (append (list line) (read-lines fd)))))

(defconstant file (open "./input.txt"))
(defconstant rawlines (read-lines file))
(defconstant numlines (length rawlines))
(defconstant linelength (length (car rawlines)))
(defconstant lines (mapcar (lambda (line) (parse-integer line :radix 2)) rawlines))

(defun sum-array (arr)
	(if (car arr) (+ (car arr) (sum-array (cdr arr))) 0))

(defun sum-masks (nums mask)
	(sum-array (mapcar
		(lambda (num) (logand mask num))
		nums)))

(defun do-i-set-the-mask-or-not (nums mask)
	(if (>
		(* 2 (sum-masks nums mask))
		(* numlines mask)
	) mask 0))

(defconstant gamma (sum-array
	(loop for i from 0 to (- linelength 1)
		collect (do-i-set-the-mask-or-not lines (expt 2 i)))))
(defconstant epsilon (- (expt 2 linelength) 1 gamma))
(print (* gamma epsilon))
(exit)
