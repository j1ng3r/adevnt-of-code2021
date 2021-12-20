(defun read-lines (fd)
	(let ((line (read-line fd nil)))
		(and line (append (list line) (read-lines fd)))))

(defconstant file (open "./input.txt"))
(defconstant rawlines (read-lines file))
(defconstant numlines (length rawlines))
(defconstant linelength (length (car rawlines)))
(defconstant lines (mapcar (lambda (line) (parse-integer line :radix 2)) rawlines))
(defun curry1 (fn &rest args) (lambda (x) (apply fn (concatenate 'list args (list x)))))

(defun sum-array (arr)
	(if (car arr) (+ (car arr) (sum-array (cdr arr))) 0))

(defun sum-masks (nums mask)
	(sum-array (mapcar
		(curry1 #'logand mask)
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

(defun get-closest-number (nums target)
	(logxor target (apply #'min (mapcar (curry1 #'logxor target) nums))))

(defconstant oxygen (get-closest-number lines gamma))
(defconstant co2 (get-closest-number lines epsilon))
(format t "~B" gamma)
(print oxygen)
(print epsilon)
(print co2)
(exit)
