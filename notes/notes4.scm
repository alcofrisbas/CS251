;;; Binding...

; let...
(let ((x 1)
      (y 2)
      (z 3))
  (cons x y))
;letrec for recursive
;let for not
     
;
;

(letrec ((x 1)
         (f (lambda (a) (cons a x))))
  (f 3))

(letrec ((x (lambda () y))
         (y 2))
  (cons x y))

(let* ((x 1)
       (y (+ x 1))
       (x 10))
  (cons x y))

;---------------------------------------------
;;;Higher order functions...
;funcitons that eat or spit out functions.

;from a list, select all _blank_

;eg (filter f lst) => list where f is a "predicate"

(define nums '(1 2 3 4 5))
(map (lambda (x) (* x x))
     nums)
(map even? nums)
(map (lambda (x) (< x 3))
      nums)

(define filter
  (lambda (f lst)
    (if (null? lst)
        '()
        (if (f (car lst))
            (cons (car lst)
                  (filter f (cdr lst)))
            (filter f (cdr lst))))))

(filter (lambda (x) (< x 3)) nums)
