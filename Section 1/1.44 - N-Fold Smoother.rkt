#lang sicp


(define (square x) (* x x))

(define dx 0.001)
(define (smooth f)
  (define (avg a b c)
    (/ (+ a b c) 3)
    )
  (lambda (x)
    (avg (f (- x dx))
         (f x)
         (f (+ x dx)))
    )
  )

(define (n-fold-smoother f i)
  (define (iter g i)
    (if (> i 0)
        (iter (smooth g) (dec i))
        g
        )
    )
  (iter f i)
  )

((n-fold-smoother square 2) 5)