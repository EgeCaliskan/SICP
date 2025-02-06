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

(define (add-rat a b)
  (rational (+ (* (enum a) (denom b)) (* (enum b) (denom a)))
            (* (denom a) (denom b))
            )
  )

(define (mul-rat a b)
  (rational (* (enum a) (enum b)) (* (denom a) (denom b)))
  )

(define (print-rat a)
  (display (/ (enum a) (denom a)))
 )



(define (value rat)
  (/ (enum rat) (denom rat))
  )

(define a (rational 3 5))
(define b (rational 1 2))

(value (add-rat a b))
(value (mul-rat a b))
