#lang sicp
(define (last list)
  (if (null? (cdr list))
      (car list)
      (last (cdr list))
      )
  )

(define (up-to-last list) ; Returns list with all elements except for the last element. 
  (if (null? (cdr list))
      nil
      (cons (car list) (up-to-last (cdr list)))
      )
  )

(define (reverse list)
  (if (null? (cdr list))
      list
      (cons (last list) (reverse (up-to-last list)))

      )
  )

(reverse (list 1 2 3 4 5 6 7 8))
