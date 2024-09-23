#lang sicp
(define (infinite-fraction n d k)

  (define (fraction i k)
    (if (> k 0)
        (/ (n i) (+ (d i ) (fraction (inc i) (dec k) )))
        0
        )
    )
  (/ 1.0 (fraction 1 k))
  )

(infinite-fraction (lambda (x) 1.0) (lambda (x) 1.0) 14)
