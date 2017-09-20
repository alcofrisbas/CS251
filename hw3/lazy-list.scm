(#%require rackunit)


(define lazy-list
  (lambda (a)
    (cons a
          (lambda () (lazy-list (+ a 1))))))

(define first-n
  (lambda (llst n)
    (if (equal? n 0)
        '()
        (cons (car llst) (first-n ((cdr llst)) (- n 1))))))

(define nth
  (lambda (llst n)
    (if (equal? n 0)
        (car llst)
        (nth ((cdr llst)) (- n 1)))))

(define lazy-add
  (lambda (llst1 llst2)
    #t
    ))

(check-equal? (first-n (lazy-list 1) 5) '(1 2 3 4 5))
(check-equal? (nth (lazy-list 1) 0) 1)
(check-equal? (nth (lazy-list 1) 1) 2)
