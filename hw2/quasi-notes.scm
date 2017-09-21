(define foo
  (lambda ()
    (lambda () (/ 1 0))))

;this is an example of i'm not sure i need to think about this!!!

(if (< 1 4 3)
    #t)
(cons (cons 1 2)
      (cons 3 4))

;Write your special Form!!!!

(define-syntax myand
  (syntax-rules ()
    ((_) #f)
    ((_ e) e)
    ((_ e1 e2 e3 ...)
     (if e1 (myand e2 e3 ...) #f))))

(myand)
(myand 3)
(myand #f (/ 0 0))
