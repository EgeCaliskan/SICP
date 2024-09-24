#lang sicp


(define (continued-fraction n d x k)

  (define (fraction i)
    (if (> i k)
        0
        (/ (n x i) (- (d i) (fraction (inc i))))
        )
    )
  (fraction 1)
  )

(define (tan-cf x k)
  (define (n x i)
    (if (= i 1)
        x
        (* x x))
    )
  (define (d i)
    (dec (* 2 i))
    )
  (continued-fraction n d x k)
  )

(tan-cf 15.0 100)

