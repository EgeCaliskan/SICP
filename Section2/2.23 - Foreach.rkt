#lang sicp
(define (foreach procedure list)
  (if (not (null? list))
      (begin
        (procedure (car list))
        (foreach procedure (cdr list))
        )
      )
  )

(foreach (lambda (x) (newline) (display (* x x))) (list 1 2 3 4 5 6))
