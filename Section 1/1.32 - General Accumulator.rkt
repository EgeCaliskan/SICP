#lang sicp
(define (accumulate combiner term a next b null-value)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner term (next a) next b null-value))))

(define (accumulate-iter combiner term a next b result)
  (if (> a b)
      result
      (accumulate combiner term (next a) next b (combiner a result))))

(define (factorial n)
  (define (multiply x y) (* x y))
  (define (identity x) x)

  (accumulate-iter multiply identity 1 inc n 1)
  )

(factorial 10)
