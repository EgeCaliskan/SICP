#lang sicp
(define (enum x) (car x))
(define (denom x) (cdr x))
(define (abs x)
  (if (< x 0)
      (- x)
      x
      )
  )
(define (rational a b)
  (if (> (* a b) 0 )
      (cons (abs a) (abs b))
      (cons (- (abs a)) (abs b)))
  )



