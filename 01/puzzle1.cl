(defun to-int (x) (if x (parse-integer x) x))

(let* (
		(in (open "./input.txt" :if-does-not-exist nil))
		(sum 0)
		fst
		snd
	)
	(defun readline nil (to-int (read-line in nil)))
	(setf snd (readline))
	(loop
		(setf fst snd)
		(setf snd (readline))
		(if snd
			(if (> snd fst) (setf sum (+ sum 1)))
			(return)
		)
	)
	(close in)
	(print sum)
)
(exit)
