#lang sicp
(define x_list (list 1 3 (list 5 7) 9))
(define x_cons (cons 1 (cons 3 (cons (cons 5 (cons 7 nil)) (cons 9 nil))))); Represent the
x_cons                                                                     ; list with cons
x_list
(car (cdr (car (cdr (cdr x_cons)))))


(newline)
(define y_list (list (list 7)))
(define y_cons (cons (cons 7 nil) nil))
y_cons
y_list
(car (car y_cons))

(newline)
(define z_list (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(define z_cons (cons 1 (cons (cons 2 (cons (cons 3 (cons (cons 4 (cons (cons 5 (cons (cons 6 (cons 7 nil)) nil)) nil)) nil)) nil)) nil)))
z_cons
z_list
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr z_cons))))))))))))
