#lang sicp
(define (length list)
  (if (null? list)
      0
      (inc (length (cdr list)))
      )
  )

(define (accessor list n)
  (if (= n 0)
      (car list)
      (accessor (cdr list) (dec n))
      )
  )

(define (last-pair list)
  (accessor list (dec (length list)))
  )

(define (last-pair-alternate list)
  (if (null? (cdr list))
      (car list)
      (last-pair-alternate (cdr list))
      )
  
  )

(define l (list 1 2 3 45 92 82 34 100))
(last-pair-alternate l)
(last-pair l)

; Here I implemented the last pair function in two ways.
; The first way gets the length of the list and accesses (length - 1)th element,
; which is the last element of the list.
; The second way cdr's down the list until (cdr list) returns null.
; When this happens, we know we reached the end of the list and (car list)
; will be the final element.
