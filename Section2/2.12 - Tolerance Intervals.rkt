#lang sicp

(define (make-interval a b)
  (if (> a b)
      (cons b a)
      (cons a b)
      )
  )
(define (upper-bound x)
  (cdr x)
  )

(define (lower-bound x)
  (car x)
  )
(define (make-center-percent point percent)
  (make-interval (* point (- 100 percent) 0.01) (* point (+ 100 percent) 0.01))
  )

(define (center i)
  (/ (+ (lower-bound i) 
        (upper-bound i)) 
     2))

(define (percent interval)
  (- (/ (upper-bound interval) (center interval) 0.01 ) 100)
  )

(define z (make-center-percent 100 5))
z
(percent z)