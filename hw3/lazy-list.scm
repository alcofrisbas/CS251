(#%require rackunit)

(define lazy-range
  (lambda (a b)
    (if (> a b)
        '()
        (cons a
              (lambda () (lazy-range (+ a 1) b))))))

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
    (lazy-add-helper llst1 llst2 '())))
;make addlist into a lazyList: done
;zero-pad:
(define lazy-add-helper
  (lambda (llst1 llst2 addList)
    (if (and (null? llst1)
             (null? llst2))
        (lst-to-llst addlist)
        (lazy-add-helper ((cdr llst1))
                         ((cdr llst2))
                         (append addlist (list(+ (car llst1) (car llst2))))))))

(define lazy-filter
  (lambda (predicate llst)
    (lazy-filter-helper predicate llst '())))

(define lazy-filter-helper
  (lambda (predicate llst predList)
    (cond ((null? llst) (lst-to-llst predList))
          ((not (predicate (car llst))) (lazy-filter-helper predicate ((cdr llst)) predList))
          (else (lazy-filter-helper predicate ((cdr llst)) (append predList (list (car llst))))))))
;(define lazy-range
;  (lambda (a b)
;    (if (> a b)
;        '()
;        (cons a
;              (lambda () (lazy-range (+ a 1) b))))))

(define lst-to-llst
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (car lst)
              (lambda () (lst-to-llst (cdr lst)))))))

(check-equal? (first-n (lazy-list 1) 5) '(1 2 3 4 5))
(check-equal? (nth (lazy-list 1) 0) 1)
(check-equal? (nth (lazy-list 1) 1) 2)

