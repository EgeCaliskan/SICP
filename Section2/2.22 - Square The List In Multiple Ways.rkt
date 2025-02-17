#lang sicp
(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))

(square-list (list 1 2 3 4 5)) ; This one produces results in reverse.
                               ; That is because newly found squares are added to the left
                               ; of the previous answer.

(square-list-2 (list 1 2 3 4 5)) ; This one produces results in the correct order
                                 ; however, the cons operators are nested weirdly.
                                 ; the expected order of nesting is: (1 (4 (9 (16 nil))))
                                 ; the program outputs the following nesting: ((((((nil)  1)  4)  9)  16)  25)
                                 ; this nesting does not register as a proper list in racket.

