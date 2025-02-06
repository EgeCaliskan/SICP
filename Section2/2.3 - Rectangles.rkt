#lang sicp

(define (point x y) (cons x y)) 
(define (x p) (car p))
(define (y p) (cdr p))

(define (abs x)
  (if (> x 0)
      x
      (- x))
  )


(define (rect-1 p1 p2)
  (cons 1 (cons p1 p2))
  )

(define (rect-2 p length height)
  (cons 2 (cons p (cons length height)))
  )

(define (type rect)
  (car rect)
  ) 



(define (len rect)
  (if (= (type rect) 1)
      (begin
        (let ((p1 (x (y rect))) (p2 (y (y rect))))
          (abs (- (x p1) (x p2))) 
          )        
        )
      (car (cdr (cdr rect)))
      )
  )

(define (height rect)
  (if (= (type rect) 1)
      (begin
        (let ((p1 (x (y rect))) (p2 (y (y rect))))
          (abs (- (y p1) (y p2))) 
          )  
        )
      (cdr (cdr (cdr rect)))
      )
  )

(define (area rect)
  (* (len rect) (height rect))
  )
(define (perimeter rect)
  (* (+ (len rect) (height rect)) 2)
  )

(define (convert rect)
  (define (rect-root rect)
        (car (cdr rect))      
    )
  (define (r1-to-r2 rect)
    (rect-2 (rect-root rect) (len rect) (height rect))
    )

  (define (r2-to-r1 rect)
    (define root (rect-root rect))
    (let ((a (x root))
          (b (y root)))
      (rect-1 root (point (+ a (len rect)) (+ b (height rect))))
      )
    )
  (if (= (type rect) 1)
      (r1-to-r2 rect)
      (r2-to-r1 rect)
      )
  )


(define r2 (rect-2 (point 2 2) 3 5))
(define r1 (rect-1 (point 2 2 ) (point 5 7)))

(perimeter r1)
(area r1)

(perimeter r2)
(area r2)