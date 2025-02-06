#lang sicp

(define (make-interval x y) (cons x y))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))
