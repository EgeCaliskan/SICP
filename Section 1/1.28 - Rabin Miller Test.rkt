#lang sicp
(define (expmod base power mod)
  (define (r x)
    (remainder x mod)
    )

  (define (square x) (* x x ))
  (define root 0)
  (cond ((= power 1) base)
        ((even? power) (begin
                         (set! root (expmod base (/ power 2) mod))
                         (if (and (not (= root 1))  (not (= root (dec mod))) (= (remainder (square root) mod ) 1))
                             0
                          
                             (r (square root))
                             ) 

                         ))
        (else (r(* base (r(expmod base (dec power) mod)))))
        )
  
  )

(define (rabin-miller-test n a)
  (cond ((= n 2) true)
        ((= n 1) false)
        ((even? n) false)
        ((< a n ) (if (= (expmod a (dec n) n) 0)
                      false
                      (rabin-miller-test n (inc a))
                      ))
        ((= n a) true)
        )
  )

(rabin-miller-test 29 1)
