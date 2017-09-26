(#%require rackunit)

;; hw 3 methods, some of which are modified
;; because they were not well done.

;; makes a lazy infinite list starting at a
(define lazy-infinite-range
  (lambda (a)
    (cons a
          (lambda () (lazy-infinite-range (+ a 1))))))

;; makes a lazy list in the range a b
(define lazy-range
  (lambda (a b)
    (if (> a b)
        '()
        (cons a
              (lambda () (lazy-range (+ a 1) b))))))

;; returns a normal scheme list of the first n
;; values of a lazy list
(define first-n
  (lambda (llst n)
    (if (equal? n 0)
        '()
        (cons (car llst) (first-n ((cdr llst)) (- n 1))))))

; modified to start at 1... just changed
; 0 in if to 1
(define nth
  (lambda (llst n)
    (if (equal? n 1)
        (car llst)
        (nth ((cdr llst)) (- n 1)))))

;; lazy-filter redesigned after Brendan's helpful feedback.
;; should work as intended now and successfully filters
;; infinite lists 
(define lazy-filter
  (lambda (predicate llst)
    (cond ((not (predicate (car llst))) (lazy-filter predicate ((cdr llst))))
                                         
          (else (cons (car llst)
                      (lambda () (lazy-filter predicate ((cdr llst)))))))))
;; end hw3 methods


;; returns bool.
;; tests divisibility of n by d
(define not-divisible?
  (lambda (d n)
    (if (integer? (/ n d))
        #f
        #t)))

;; a curried form of not-divisible,
;; which is a unary function
(define not-divisible-by?
  (lambda (d)
    (lambda (n)
    (define lazy-filter
  (lambda (predicate llst)
    (cond ((not (predicate (car llst))) (lazy-filter predicate ((cdr llst))))
                                         
          (else (cons (car llst)
                      (lambda () (lazy-filter predicate ((cdr llst)))))))))  (not-divisible? d n))))   
;; returns an infinite lazy list of primes
;; takes no params.
(define primes
  (lambda ()
    (sieve (lazy-infinite-range 2))))

;; returns a lazy list of primes given an infinite lazy list
(define sieve
  (lambda (llst)
    (cons (car llst)
          (lambda () (sieve (lazy-filter (lambda (x) ((not-divisible-by? (car llst)) x)) llst))))))




(check-equal? (nth (primes) 20) 71)

(check-equal? (nth (primes) 1234) 10061)

(check-equal? (first-n (primes) 10) '(2 3 5 7 11 13 17 19 23 29))
