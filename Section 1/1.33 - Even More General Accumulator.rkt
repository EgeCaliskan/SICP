#lang sicp
(define (gcd a b)
  (define result 1)
  (define (divides? x y)
    (= (remainder y x) 0 ))
  (define (next x)
    (if (even? x)
        (+ 1 x)
        (+ 2 x)))
    
  (define (test x)

    (cond ((or (> x a) (> x b)) result)
          ((and (divides? x a) (divides? x b))
           (begin (set! result (* result x))
                  (set! a (/ a x))
                  (set! b (/ b x))
                  (test (next x)) ))
          (else (test (next x)))
          )
    
    )
  (test 2) )

(define (accumulate combiner a b term condition null-value next)
  (cond ((> a b) null-value)
        ((condition a) (combiner (term a) (accumulate combiner (next a) b term condition null-value next)))
        (else (accumulate combiner (next a) b term condition null-value next))
        
        )
  )

(define (coprime-product n)
  (define (multiply x y) (* x y))
  (define (coprime? x) (= (gcd x n) 1))
  (define (identity x) x)


  (accumulate multiply 1 (- n 1) identity coprime? 1 inc)
  )

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
  (cond (( = n 1) false)
        ( ( = n 2) true)
        ((even? n) false)
        ((< a n ) (if (= (expmod a (dec n) n) 0)
                      false
                      (rabin-miller-test n (inc a))
                      ))
        ((= n a) true)
        )
  )


(define (square-prime-sum n)
  (define (sum x y ) (+ x y))
  (define (prime? x) (rabin-miller-test x 2))
  (define (square x) (* x x))
  (accumulate sum 1 n square prime? 0 inc)
  )
  
(coprime-product 15)
(square-prime-sum 10)
