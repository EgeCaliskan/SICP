#lang sicp
(define threshold 0.0001)
(define (f x) (+ 1 (/ 1.0 x)))
(define (abs x) (if (< x 0) (- x) x))
(define (<= x y) (or (< x y) (= x y)))
(define (fixed-point f guess) 

  (let ( (f-guess (f guess))
         (f-next  (f (f guess))) )
    f-next
    (if (<= (abs (- f-guess f-next)) threshold)
        guess
        (fixed-point f f-guess)
    ))
)
(fixed-point f 3.0)
