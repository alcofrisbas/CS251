(#%require rackunit)

;; makes a lazy list given a range
;; a provided method and thus
;; not assigned, but still valuable
;; in testing
(define lazy-range
  (lambda (a b)
    (if (> a b)
        '()
        (cons a
              (lambda () (lazy-range (+ a 1) b))))))

;; constructs an infinitely long lazy list
;; given the first number as a parameter
(define lazy-infinite-range
  (lambda (a)
    (cons a
          (lambda () (lazy-infinite-range (+ a 1))))))

;; returns the first n values of a lazy list
;; as an ordinary scheme list
(define first-n
  (lambda (llst n)
    (if (equal? n 0)
        '()
        (cons (car llst) (first-n ((cdr llst)) (- n 1))))))

;; returns the nth value of a lazy list
;; with llst and n as params
(define nth
  (lambda (llst n)
    (if (equal? n 0)
        (car llst)
        (nth ((cdr llst)) (- n 1)))))

;; adds the values of two lazy lists
;; together and returns a third
;; lazy list with the each
;; value being the sum of the corresponding
;; index from llst1 and lls2.
;; if the list lenghts don't match
;; the function zero-pads
(define lazy-add
  (lambda (llst1 llst2)
    (lazy-add-helper llst1 llst2 '())))

;; helper method for lazy-add. Actually
;; does all the work. Deserves more credit.
(define lazy-add-helper
  (lambda (llst1 llst2 addList)
    (if (and (null? llst1)
             (null? llst2))
        (lst-to-llst addlist)
        (cond ((null? llst1)
               (lazy-add-helper llst1
                                ((cdr llst2))
                                (append addlist (list(+ 0 (car llst2))))))
              ((null? llst2)
               (lazy-add-helper ((cdr llst1))
                                llst2
                                (append addlist (list(+ (car llst1) 0)))))
              (else (lazy-add-helper ((cdr llst1))
                                     ((cdr llst2))
                                     (append ad(lazy-filter (lambda (x) (= (modulo x 2) 0)) nums)dlist (list(+ (car llst1) (car llst2))))))))))

;; Returns a lazy list containing
;; all the values in the given lazy list
;; returns true from the given predicate.
(define lazy-filter
  (lambda (predicate llst)
    (lazy-filter-helper predicate llst '())))

;; helper for lazy-filter.
;; again does all the work with
;; little to no credit.
;; we need a auxiliary method appreciation day.
(define lazy-filter
  (lambda (predicate llst)
    (cond ((not (predicate (car llst))) (lazy-filter predicate ((cdr llst))))
                                         
          (else (cons (car llst)
                      (lambda () (lazy-filter predicate ((cdr llst)))))))))

(lazy-filter (lambda (x) (= (modulo x 2) 0)) (lazy-infinite-range 1))
(first-n (lazy-filter (lambda (x) (= (modulo x 2) 0)) (lazy-infinite-range 1)) 5)
;(lazy-filter-helper (lambda (x) (> 0 x)) (lazy-infinite-range 1))

;; converts a list to a lazy list
;; great for testing and returning
;; lazy lists
(define lst-to-llst
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (car lst)
              (lambda () (lst-to-llst (cdr lst)))))))


(define lazy-range
  (lambda (a b)
    (if (> a b)
        '()
        (cons a
              (lambda () (lazy-range (+ a 1) b))))))

