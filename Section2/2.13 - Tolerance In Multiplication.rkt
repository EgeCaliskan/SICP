#lang sicp

(define (make-interval x y)
  (if (> x y)
      (cons y x)
      (cons x y)
      )
  )
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (make-center-percent point percent)
  (make-interval (* point (- 100 percent) 0.01) (* point (+ 100 percent) 0.01))
  )


(define (percent interval)
  (- (/ (upper-bound interval) (center interval) 0.01 ) 100)
  )

(define (mult-interval a b)
  (let ((p1 (* (lower-bound a) (lower-bound b))) (p2 (* (lower-bound a) (upper-bound b))) (p3 (* (upper-bound a) (lower-bound b))) (p4 (* (upper-bound a) (upper-bound b)) ))

    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))
    )
  )

(define (mul-tolerance a b) ; a is the tolerance of the first interval, b is the tolerance of the second interval.
                            ; function returns the tolerance of the resulting interval, without performing the multiplication itself.
  (/ (* (+ a b) 10000) (+ (* a b) 10000))
  )


(define i1 (make-center-percent 153 27))
(define i2 (make-center-percent 298 12))

(mul-tolerance (percent i1) (percent i2))
(percent (mult-interval i1 i2))
