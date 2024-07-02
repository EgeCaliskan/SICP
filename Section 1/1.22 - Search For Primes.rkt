#lang sicp
(define (next x)
  (if (even? x)
      (+ x 1)
      (+ x 2))
  )
(define found-primes 0)
(define (prime? n)
  (define (is-divisor? x)
    (= (remainder n x) 0))
  
  (define (test x)
    (cond ((> (* x x) n)  true)
          ((is-divisor? x) false)
          (else (test (next x)))
          )
    )
  (test 2)
  )
(define (println x)
  (display x)
  (newline))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (begin
        (report-prime (- (runtime) start-time))
        (display n)
        (newline)
        (set! found-primes (+ found-primes 1))
        )
      ))
(define (report-prime elapsed-time)
  
  (display elapsed-time)
  (display " *** ")
  )

(define (find-primes lower upper count)
  (if (and (> count found-primes) (not (> lower upper)))
      (begin
        (timed-prime-test lower)
        (find-primes (next lower) upper count)
        )
      )
  )

(find-primes 1000 10000 3)

