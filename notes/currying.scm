(define sum
  (lambda (a)
    (lambda (b) (+ a b))))

((sum 3) 2)

(define add3 (sum 3))
(add3 2)