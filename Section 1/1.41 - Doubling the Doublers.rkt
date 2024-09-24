#lang sicp

(define (double f)
  (lambda (x)
    (f (f x)))
  )


(((double (double double)) inc) 5)



; (double double) will double twice (or quadruple)
; (double (double double)) will call the quadruple function on itself
; in this way, it will run the inc function 16 times.