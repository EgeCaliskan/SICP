#lang sicp
(define (sum a b term next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result)))

    )
  (iter a 0))


(define (cube-sum a b)
  (define (term a) (* a a a))
  (define (next a) (+ a 1))
  (sum a b term next))

(cube-sum 1 10)
