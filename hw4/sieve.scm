(define lazy-infinite-range
  (lambda (a)
    (cons a
          (lambda () (lazy-infinite-range (+ a 1))))))

(define lazy-range
  (lambda (a b)
    (if (> a b)
        '()
        (cons a
              (lambda () (lazy-range (+ a 1) b))))))

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
(define lazy-filter-helper
  (lambda (predicate llst predList)
    (cond ((null? llst) (lst-to-llst predList))
          ((not (predicate (car llst))) (lazy-filter-helper predicate
                                                            ((cdr llst))
                                                            predList))
          (else (lazy-filter-helper predicate
                                    ((cdr llst))
                                    (append predList (list (car llst))))))))

(define filter
  (lambda (f lst)
    (if (null? lst)
        '()
        (if (f (car lst))
            (cons (car lst)
                  (filter f (cdr lst)))
            (filter f (cdr lst))))))

(define primes
 (lambda ()
   #t))

(define primes-helper
  (lambda (predicate llst predlist)
    #t))