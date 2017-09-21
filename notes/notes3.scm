(define list-ref1
  (lambda (lst k)
    (if (= k 0)
        (car lst)
        (list-ref (cdr list)
                  (- k 1)))))

(define length-1
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1
           (length (cdr lst))))))

(define length-better
  (lambda (lst)
    (length-helper lst 0)))
;tail call recursion helpppppppp me.
(define length-helper
  (lambda (lst result)
    (if (null? lst)
        result
        (length-helper (cdr lst)
                       (+ 1 result)))))
    

(define append1
  (lambda (lst1 lst2)
    (if (null? lst1)
        lst2
        (cons (car lst1)
              (append1 (cdr lst1)
                       lst2)))))
(define reverse-1
  (lambda (lst)
    (if (null? lst)
        '()
        (append1 (reverse-1 (cdr lst))
                 (list (car lst))))))
