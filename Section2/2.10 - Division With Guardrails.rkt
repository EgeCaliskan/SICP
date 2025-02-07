#lang sicp

(define (make-interval x y)
  (if (> x y)
      (cons y x)
      (cons x y)
      )
  )
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (add-interval a b)
  (make-interval (+ (lower-bound a) (lower-bound b)) (+ (upper-bound a) (upper-bound b))) 
  )

(define (mult-interval a b)
  (let ((p1 (* (lower-bound a) (lower-bound b))) (p2 (* (lower-bound a) (upper-bound b))) (p3 (* (upper-bound a) (lower-bound b))) (p4 (* (upper-bound a) (upper-bound b)) ))

    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))
    )
  )

(define (div-interval x y)
  (begin
    (if (or (= x 0) (= y 0))
     (display "Cannot divide by zero.")
     (mult-interval x 
                   (make-interval 
                    (/ 1.0 (upper-bound y)) 
                    (/ 1.0 (lower-bound y))))
     ))
  )

(define (sub-interval a b)
  (define m (make-interval (- (upper-bound b)) (- (lower-bound b))))
  (add-interval a m)
  )


(define (width a)
  (/ (- (upper-bound a) (lower-bound a)) 2)
  )

;Width of the sum of two intervals is equal to the sum of their individual widths.
;Let I1 (a,b) , I2 (c,d), I3 = I1 + I2 = (a+c, b+d)
;Let W represent the width of an interval.
;W(I1) = (b - a)/ 2, W(I2) = (d - c) / 2.
;W(I1) + W(I2) = (b+d - (a+c))/2 = W(I3)

;Width of the multiplication of two intervals might not be equal to the multiplication of their individual widths.
;Example: I1 = (-5 -2) , I2 = (-10, 7)

(define I1 (make-interval -5 -2))
(define I2 (make-interval -10 7))

(width I1)
(width I2)
(width (mult-interval I1 I2))
(* (width I1) (width I2) )