#lang sicp

(define (make-interval x y)
  (if (> x y)
      (cons y x)
      (cons x y)
      )
  )
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (add-interval a b)
  (make-interval (+ (lower-bound a) (lower-bound b)) (+ (upper-bound a) (upper-bound b))) 
  )



(define (mult-interval a b)
  (let ((p1 (* (lower-bound a) (lower-bound b))) (p2 (* (lower-bound a) (upper-bound b))) (p3 (* (upper-bound a) (lower-bound b))) (p4 (* (upper-bound a) (upper-bound b)) ))

    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))
    )
  )

(define (div-interval x y)
  (begin
    (if (or (= (lower-bound y) 0) (= (upper-bound y) 0))
        (display "Cannot divide by zero.")
        (mult-interval x 
                       (make-interval 
                        (/ 1.0 (upper-bound y)) 
                        (/ 1.0 (lower-bound y))))
        ))
  )

(define (make-center-percent point percent)
  (make-interval (* point (- 100 percent) 0.01) (* point (+ 100 percent) 0.01))
  )

(define (par1 r1 r2)
  (div-interval 
   (mult-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval 
     one
     (add-interval 
      (div-interval one r1) 
      (div-interval one r2)))))

(define R1 (make-center-percent 200 5 ))
(define R2 (make-center-percent 520 5))

(display "R1:")
R1
(display "R2:")
R2

(display "Par1:")
(par1 R1 R2)

(display "Par2:")
(par2 R1 R2)
(define (reciprocal y)
  (make-interval 
   (/ 1.0 (upper-bound y)) 
   (/ 1.0 (lower-bound y)))
  )
(display "(R1 * R2) / R2:\n")
(div-interval (mult-interval R1 R2) R2)
; As it can be seen from the outputs of the program, multiplying an interval R1 by R2
; and then dividing it by R2 does not give R1, but gives a different result.
; This is the issue that causes the processes to give different results, as this algebraic manipulation
; is the difference between the two processes.

(display "R1 / R1:")
(div-interval R1 R1)

; It can also be observed that dividing an interval by itself does not give the interval (1,1).
; This is related to the previous issue where (R1/R2) * R2 != R1.
