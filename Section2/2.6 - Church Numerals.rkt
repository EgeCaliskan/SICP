#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x))))
  )

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x) )))
  )

 
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

((one inc) 0)
((two inc) 0)
(((add one two) inc) 0)

(((add two two) inc) 0)