#lang sicp
(define (interval a b)
  (if (> b a)
      (cons a b)
      (cons b a)
      )
  )

(define (upper-bound interval) 
  (cdr interval)
  )

(define (lower-bound interval)
  (car interval)
  )

(define (alternative-multiply-intervals a b)
  (define (sign x)
    (cond ((> x 0) 1)
          ((= x 0) 0)
          ((< x 0) -1))
    )

  (define u1 (upper-bound a))
  (define u2 (upper-bound b))
  (define l1 (lower-bound a))
  (define l2 (lower-bound b))

  (define (check-sign sl1 su1 sl2 su2) ;adding zero makes it way more complicated, so I will implement only nonzero signs.
    (and (= (sign l1) sl1) (= (sign u1) su1) (= (sign l2) sl2) (= (sign u2) su2) ))
  (cond ((check-sign   1  1  1  1) (interval (* l1 l2) (* u1 u2)))
        ((check-sign  -1  1  1  1) (interval (* l1 (max u1 u2)) (* u1 u2)))
        ((check-sign  -1  1 -1  1) (interval (* (min l1 l2) (max u1 u2)) (max (* l1 l2) (* u1 u2) )))
        ((check-sign   1  1 -1  1) (interval (* l2 (max u1 u2)) (* u1 u2)))
        ((check-sign  -1 -1 -1 -1) (interval (* u1 u2) (* l1 l2)))
        )
  )


(alternative-multiply-intervals (interval -1 2) (interval 3 5))
