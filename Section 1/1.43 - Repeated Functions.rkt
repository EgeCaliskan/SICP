#lang sicp

(define (compose f g)
  (lambda (x) (f (g x)))
  )
(define (square x) (* x x))

(define (repeated f i)
  (define (iter g i)
    (if (> i 1)
        (iter (compose f g) (dec i))
        g
        )
    )
  (iter f i)
  )

((repeated square 2) 5)
