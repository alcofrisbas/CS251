; fold l and fold r

; What is folding?


(define nums '(1 2 3 4))
;(foldl f init '(1 2 3 4))
;(f 4 (f 3 (f 2 (f 1 init))))
;
;(foldr f init '(1 2 3 4))
;(f 1 (f 2 (f 3 (f 4 init))))


; tail recursive
(define foldl
  (lambda (f init lst)
    (if (null? lst)
        init
        (foldl f (f (car lst) init) (cdr lst)))))

; not tail recursive; not faster, use fold l when it doesn't matter
(define foldr
  (lambda (f init lst)
    (if (null? lst)
        init
        (f (car lst)
           (foldr f
                  init
                  (cdr lst))))))


;(define comp
;  (lambda (x y)
;    (if (> x y)
;        x
;        y)))
;
;(define count
;  (lambda (x tally)
;    (if (eq? x 3)
;        (+ tally 1)
;        tally)))
;
;(foldl + 1 nums)
;(comp 1 2)
;
;; how to evaluate things...
;; pop quiz...
;
;;(define x 1)
;;
;;(let ((x 2))
;;  x)
;;
;;((lambda (x) x) 3)
;;
;;((lambda (y) x) 4)
;;
;;(let ((x (+ x 1)))
;;  x)
;
;;(letrec (( x (+ x 1)))
;; x)
;
;(((lambda (x y)
;    (lambda (y z)
;      (list x y z)))
;  5 6)
; 7 8)
;
;((lambda (x y)
;   (lambda (y z)
;     (list x y z)))
; 5 6)

;; RECURSIVE SUBSTITUTION

; eval 1 if e is a prim. return e
; eval 2 IF E IS A VARIABLE, LOOK UP VALUE.
; eval 3 if e is a list return (e1,e2,e3...ek)
; eval 3.1 if e1 is a special form  do something special
; eval 3.2 evaluate e1...ek in any order. and apply first value to the rest.
;          map evalueate

; apply: substitute formal params for actuals. in the body
; evaluate the body.

(define evaluate
  (lambda (e)
    (cond ((primitive? e)        e)
          ((symbol? e)           (substitute0-symbol old new e))
          ((eq? (car e) 'IF)     (cons 'IF
                                       (map helper (cdr e))))
          ((eq? (car e) 'QUOTE)  (cadr e))
          ((eq? (car e) 'LAMBDA) e)
          ((eq? (car e) 'DEFINE) (bind (cadr e) (evaluate (caddr e))))
          (else                  (applicate (evaluate (car e))
                                            (map evaluate (cdr e)))))))

(define primitive?
  (lambda (e)
    (or (number? e) (boolean? e) (string? e))))
; if e is in old, replace with respective new
(define substitute-symbol 
  (lambda (old new e)

(define substitute
  (lambda (old new e)
    (letrec
        ((helper
          (lambda (e)
    (cond ((primitive? e)        e)
          ((symbol? e)           (substitute0-symbol old new e))
          ((eq? (car e) 'IF)     (cons 'IF
                                       (map helper (cdr e))))
          ((eq? (car e) 'QUOTE)  (cadr e))
          ((eq? (car e) 'LAMBDA) (let ((formals (cadr e))
                                       (body (caddr e)))
                                   (list 'LAMBDA
                                         formals
                                         (helper body))
                                 
          ((eq? (car e) 'DEFINE) (bind (cadr e) (evaluate (caddr e))))
          (else                  (applicate (evaluate (car e))
                                            (map evaluate (cdr e)))))))

; (map (lambda (x) (helper shield x)))
; error display
(define error
  (lambda msgs
    (map display msgs)
    (newline)))

(define applicate
  (lambda (f args)
    (f (list? f)
       ;; assume first is lambda
       (let ((formals (cadr f))
             (body (caddr f)))
         (evaluate (substitute formals args body)))
       ;; scheme primitive
       (apply f args))))

(define substitute
  (lambda (old new)

(bind 'PLUS +)

(define lookup
  (lambda (e)
    (if (symbol? e)
        e
        #f)))