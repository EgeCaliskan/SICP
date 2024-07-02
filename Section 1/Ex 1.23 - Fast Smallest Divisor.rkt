#lang sicp


(define (smallest-divisor n)
  (define (next x)
    (if (even? x)
        (+ x 1)
        (+ x 2))
    )
  (define (divides x n)
    (= (remainder n x) 0))
  (define (test x)
    (if (divides x n)
        x
        (test (next x)))
    )
  (test 2)
  )

(smallest-divisor 323)
