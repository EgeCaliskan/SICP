#lang sicp
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y) ; Appending lists results in a list with all the elements in both lists. So the result is (list 1 2 3 4 5 6)
(cons x (cons 3 nil))   ; When we apply cons, we create the following structure : (cons (list 1 2 3) (cons 4 (cons 5 (cons 6 nil))))
                        ; Which in turn becomes: (cons (x (cons 4 (cons 5 (cons 6 nil)))))
                        ; This structure is the blueprint for a list! So when we do (cons x y), we create a list whose first element is the list x.
                        ; The remaining elements of the result are just the elements of y.
                        ; The result is ((1 2 3) 4 5 6)

(list x y) ; This one is very simple.
           ; We create a list, whose first element is x and second element is y.
           ; The result is ((1 2 3) (4 5 6))
