#lang sicp

(define (% a b) (remainder a b))

(define (square a)
  (* a a)
  )
(define (pow a b)  
  (cond ((= b 0) 1)
        ((= b 1) a)
        ((= (% b 2) 0) (square (pow a (/ b 2))))
        (else (* (pow a (dec b)) a))
        )
  )


(define (cons a b)
  (* (pow 2 a) (pow 3 b))
  )

(define (car a)
  (define (div n c)
    (if (= (% n 2) 0)
        (div (/ n 2) (inc c))
        c
        )
    )

  (div a 0)
  )

(define (cdr a)
  (define (div n c)
    (if (= (% n 3) 0)
        (div (/ n 3) (inc c))
        c
        )
    )
  (div a 0)
  )
(define z (cons 3 2))
(cdr z)
(car z)