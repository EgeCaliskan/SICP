#lang sicp

(define tolerance 0.000001)
(define (fixed-point f guess)
  (display guess)
  (newline)
  (define (close? a b)
    (< (abs (- a b)) tolerance))
  (define (avg a b)
    (/ (+ a b) 2))
  (let ((next (f guess)))
    (if (close? guess next)
        guess
        (fixed-point f (avg next guess))
    ))
  )

(fixed-point (lambda (x) (/ (log 1000) (log x))) 100.0)
