#lang sicp
;Carmichel numbers
;561 
;1105
;1729
;2465
;2821
;6601
    
;if n is prime, for any a less than a that:
;a^n % n = a % n (this condition also holds true for some non-prime n values.
;                 these n-values are called Carmichael numbers)


(define (square x) (* x x))
(define (expmod base pow n)
  (define (r x) (remainder x n))
  (cond ((= pow 1) base)
        ((even? pow) (r (square (r(expmod base (/ pow 2) n)) )))
        (else (r (* base (r (expmod base (dec pow) n)))))
        )
  )

(define (carmichael n)
  (cond ((= n 0) 0561)
        ((= n 1) 1105)
        ((= n 2) 1729)
        ((= n 3) 2465)
        ((= n 4) 2821)
        ((= n 5) 6601)
        )
  )
(define (fermats-test a n)
  (if (not (> n a ))
      (display ("a must be less than n!"))
      (= (expmod a n n) (remainder a n))
      )
  
  )

(define (confirm-carmichael n a)
  (cond ((= a n) true)
        ((fermats-test a n) (confirm-carmichael n (inc a)))
        (else (begin
                false))
        )
  )
(define (carmichael-test c)
  (display "Carmichael test of ")
  (display (carmichael c) )
  (display " : ")
  (cond ((> c 0) (begin
                   (display (confirm-carmichael (carmichael c) 2))
                   (newline)
                   (carmichael-test (dec c))
                   ))
        ((= c 0) (display (confirm-carmichael (carmichael c) 2)))
        )
  )
(carmichael-test 5)
