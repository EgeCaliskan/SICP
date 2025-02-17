#lang sicp
(define (map func items)
  (if (null? items)
      nil
      (cons (func (car items)) (map func (cdr items)) )
      )
  )
(define (square x) (* x x) )
(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items)) (square-list (cdr items)))
      )
  )

(define (square-list-2 items)
  (map square items)
  )



(define l (list 1 2 3 4 5 6))

(square-list-2 l)
(square-list l)
