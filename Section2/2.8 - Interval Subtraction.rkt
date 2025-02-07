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


(define (sub-interval a b)
  (define m (make-interval (- (upper-bound b)) (- (lower-bound b))))
  (add-interval a m)
  )
(sub-interval (make-interval -1 5) (make-interval -1 7))