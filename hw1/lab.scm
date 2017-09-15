;exercise 1
(car (cdr (cdr '(jane elizabeth mary kitty lydia))))
(car (car (cdr (cdr (car '(((jane) (elizabeth) (mary) (kitty) (lydia))))))))
(car (car (car (cdr (cdr '(jane (elizabeth) ((mary)) (((kitty))) ((((lydia))))))))))
(newline)

;excercise 2
(define keep-first-n
  (lambda (x lst)
    (if (< (length lst) x)
        (begin
          (display "n exceeds list length")
          (newline))
        (if (> 0 x)
            (begin
              (display "n needs to be a non-negative number")
              (newline))
            (if (equal? (length lst) x)
                lst
                (keep-first-n x (reverse (cdr (reverse lst)))))))))

;excercise 3
(define sum
  (lambda (lst)
    (if (null? lst)
        (begin
          (display "Enter a non-null list")
          (newline))
        (if (equal? (length lst) 1)
            (car lst)
            (begin
              (sum (append (list (+ (car lst) (car (cdr lst)))) (cdr (cdr lst)))))))))


;boundary tests
(keep-first-n 5 '(a b c))
(keep-first-n -5 '(a b c))
(keep-first-n 2 '(a b c d e f g h))
;sum example
(newline)
(sum '(1 2 3 4 5 6 7 8 9))
(sum '())