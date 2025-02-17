#lang sicp
(define (% a b) (remainder a b))
(define (same-parity n . l)

  (define (parity r w)
    (cond ((null? w) nil)
          ((= (% (car w) 2) r)
           (cons (car w) (parity r (cdr w))))
          (else (parity r (cdr w))))
    )
  (cons n (parity (remainder n 2) l))
  )


(same-parity 9 1 2 3 4 5 6)
