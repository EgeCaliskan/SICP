#lang sicp
(define (accumulate combiner term a next b null-value)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner term (next a) next b null-value))))


(define (factorial n)
  (define (multiply x y) (* x y))
  (define (identity x) x)

  (accumulate multiply identity 1 inc n 1)
  )
