#lang sicp
(define tolerance 0.000001)
(define dx 0.000001)
(define (fixed-point f guess)
  (define next (f guess))
  (define (close? a b) (< (abs (- a b)) tolerance))
  (if (close? next guess)
      guess
      (fixed-point f next)
      )
  )

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x) ) dx)))

(define (newton-transform g)
  (lambda (x)
    (- x  (/ (g x) ((deriv g) x)))
    )
  )

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess)
  )

(define (cubic a b c)
  (define (cube x) (* x x x))
  (define (square x) (* x x))
  (lambda (x)
    (+ (cube x) (* a (square x)) (* b x) c))
  )
(let ((a 10)
      (b 2)
      (c 1))
(begin
  (define solution (newton-method (cubic a b c) 1))
  (display solution)
  (newline)
  (display ((cubic a b c) solution)))
      )
  

