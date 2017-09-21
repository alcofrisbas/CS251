(define-syntax assert
  (syntax-rules ()
    ((_) #f)
    ((_ e1 e2 e3 ...) (cons e1 (list e2 e3 ...)))))

; Variadicity
; the arity of a function
; number of params

; fn is variadic if its arity is
; not fixed.
;
;more ops:
;
;range
;list ref lst k returns kth element of list
;length duh
;append lst1 lst2 returns (lst1 lst2)
;
;
;

(define list1
  (lambda lst
    (if (null? lst)
        '()
        (cons (car lst)
              (apply list (cdr lst))))))
(assert 'ben 'boy)
(assert)
(assert 'ben 'boy 'student)

(define variadic-proc
  (lambda x
    x))

(define range
  (lambda (i j)
    (if (> i j)
        '()
        (cons i
              (range (+ i 1)
                     j)))))
;working lazy infinite range
(define lazy-infinite-range
  (lambda (first)
    (cons first
          (lambda () (lazy-infinite-range (+ first 1))))))
;use lambda shielding in notes 1 to complete the hw assignment due on friday
;return first n of a lazy list... 
(define first-n
  (lambda (llst n)
    (if (equal? n 0)
        '()
        (first-n (cdr (llst)) (- n 1)))))

;(first-n (lazy-infinite-range 1) 4)
    

(lazy-infinite-range 5)

((cdr (lazy-infinite-range 1)))