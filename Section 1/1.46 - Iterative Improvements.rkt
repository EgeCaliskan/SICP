#lang sicp


(define (iterative-improvement good? next damping)

  (define (iterate guess)
    (define next-guess (next guess))
    (cond ((good? guess next-guess ) guess)
          (damping (iterate (/ (+ guess next-guess) 2)))
          (else (iterate next-guess))
          ) 
    )

  (iterate 1.0)
  )



(define (fixed-point f)
  (define (next guess)
    (f guess)
    )
  (define (good? guess next-guess)
    (< (abs (- guess next-guess)) 0.00001)
    )

  (iterative-improvement good? next false)
  )

(define (sqrt x)
  
  (define (next guess)
    (/ x guess)
    )

  (define (good? guess next-guess)
    (< (abs (- guess next-guess)) 0.00001)
    )
  (iterative-improvement good? next true)
  )



