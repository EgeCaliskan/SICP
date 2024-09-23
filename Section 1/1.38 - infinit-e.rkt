#lang sicp

(define (infinite-fraction n d k)

  (define (fraction i k)
    (if (> k 0)
        (/ (n i) (+ (d i ) (fraction (inc i) (dec k) )))
        0
        )
    )
  (fraction 1 k)
  )

(define (infinit-e k)
  (define (n k) 1)
  (define (d k)
    (cond ((< k 3) k)
          ((= (remainder (- k 2) 3) 0) ( * 2 (inc (/ (- k 2) 3))))
          (else 1.0))
     )
  (+ 2 (infinite-fraction n d k))
  )

(infinit-e 10000)