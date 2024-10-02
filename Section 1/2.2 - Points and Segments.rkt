#lang sicp

(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-segment a b)
  (cons a b)
  )

(define (make-point x y)
  (cons x y)
  )
(define (add-points a b)
  (make-point (+ (x-point a) (x-point b)) (+ (y-point a) (y-point b)))
  )

(define (div-point-num a b)
  (make-point (/ (x-point a) b) (/ (y-point a) b))
  )



(define (midpoint-segment s)
  (define start (start-segment s))
  (define end (end-segment s))

  (div-point-num (add-points start end) 2)
  
  )
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline)
  )
(print-point (midpoint-segment (make-segment (make-point 3 5) (make-point 0 10))))

