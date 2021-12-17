(defun to-int (x) (and x (parse-integer x)))

(let* (
		(in (open "./input.txt" :if-does-not-exist nil))
		(sum 0)
		fst
		snd
		thd
		fth
	)
	(defun readline nil (to-int (read-line in nil)))
	(setf snd (readline))
	(setf thd (readline))
	(setf fth (readline))
	(loop
		(setf fst snd)
		(setf snd thd)
		(setf thd fth)
		(setf fth (readline))
		(if (not fth) (return))
		(if (> fth fst) (setf sum (+ sum 1)))
	)
	(close in)
	(print sum)
)
(exit)
