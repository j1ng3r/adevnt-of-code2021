(defun read-lines (fd)
	(let ((line (read-line fd nil)))
		(and line (append (list line) (read-lines fd)))))

(defconstant file (open "./input.txt"))
(defconstant rawlines (read-lines file))
(defconstant linelength (length (car rawlines)))
(defconstant lines (mapcar (lambda (line) (parse-integer line :radix 2)) rawlines))
(defun curry1 (fn &rest args) (lambda (x) (apply fn (concatenate 'list args (list x)))))
(defun apple (fn &rest args) (apply fn args))

(defun sum-array (arr)
	(if (car arr) (+ (car arr) (sum-array (cdr arr))) 0))
(defun bool-to-int (B) (if B 1 0))

(defun sum-masks (nums mask)
	(sum-array (mapcar
		(curry1 'logand mask)
		nums)))

(defun most-common (nums mask)
	(>=
		(sum-masks nums mask)
		(* (length nums) mask 1/2)))

(defun big-loop (filter-fn) (let ((lines-iter lines))
	(loop for i from 0 to (- linelength 1) do
		(let* (
			(mask (expt 2 (- linelength 1 i)))
			(btmask (if (most-common lines-iter mask) mask 0)))
				(setf lines-iter (apple filter-fn
					(lambda (x) (= (logand mask x) btmask))
					lines-iter))
				(if (= 1 (length lines-iter)) (return))))
	(car lines-iter)))

(defconstant o2 (big-loop 'remove-if-not))
(defconstant co2 (big-loop 'remove-if))

(print (* o2 co2))
(exit)
