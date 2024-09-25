#lang sicp






(define tolerance 0.01)
(define (fixed-point f guess d)
  (display guess)
  (newline)
  
  (define (close? a b)
    (< (abs (- a b)) tolerance))
  (define (halve x) (/ x 2))
  (define (n-damp a b)
    (/ (+ a b) (pow 2 d))
    )

  (let ((next (f guess)))
    (if (close? guess next)
        guess
        (fixed-point f (n-damp next guess) d) 
    ))
  )

(define (pow b p)
  (if (> p 1)
      (* b (pow b (dec p)))
      b
      )
  )

(define (nth-root x n d)
  (fixed-point (lambda (y) (/ x (pow y (dec n)))) 1.0 d)

  )

(nth-root 100 6 2)
; Here is how much damping each root needs (the results aren't cohesive enough to draw conclusions)
; 2  - 1
; 3  - 1
; 4  - 2
; 5  - 2
; 6  - 2
; 7  - 3
; 8  - 2
; 9  - 2
; 10 - 2
; 11 - 2
; 12 - 2
; 13 - 2