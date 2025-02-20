#lang sicp

(define (last list) ; Returns the last element of a list.
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

(define (deep-reverse list) ; Modified Reverse function. If the last element is a list, reverses the element before concatenating it to the result.
    (cond ((null? list) nil)
          ((pair? (last list)) (cons (deep-reverse (last list)) (deep-reverse (up-to-last list))))
          (else (cons (last list) (deep-reverse (up-to-last list)))))
  )

(deep-reverse (list (list 1 2 (list 4 5 6) 4 5) 2 3 4 5 ))
(deep-reverse (list (list 1 2 3) (list 4 5 6)))
(define x 
  (list (list 1 2) (list 3 4)))
(deep-reverse x)
