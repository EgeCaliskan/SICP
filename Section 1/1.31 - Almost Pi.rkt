#lang sicp

(define (product-recursive a b term next)

  (if (> a b)
      1
      ( * (term a) (product (next a) b term next)) 
      )
  )

(define (product-iter a b term next result)
  (if (> a b)
      result
      (product-iter (next a) b term next (* result (term a)))
      )
  )

(define (factorial x)
  (define (term x) x)
  (define (next x) (+ x 1))
  (product 1 x term next))

(define (approx-pi n)
  (define (upper-term x)
    (if (even? x)
        (+ 2.0 x)
        (+ 1.0 x))
    )
  (define (lower-term x)
    (if (odd? x)
        (+ 2.0 x)
        (+ 1.0 x))
    )
  (define (term x)
    (/  (upper-term x) (lower-term x)))

  ( * 4 (product-iter 1 n term inc 1))
  
  )


(define (println x)
  (display x)
  (newline))

(println (approx-pi 10000))
(println (factorial 10))
