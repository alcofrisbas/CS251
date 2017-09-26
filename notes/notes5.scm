(define nums '(1 2 3 4 5))

(map (lambda (x) (* x x))
     nums)

(map even? nums)

(map (lambda (x) (< x 5))
     nums)

(define map-1
  (lambda (f lst)
    (if (null? lst)
        '()
        (cons (f (car lst))
              (map-1 f (cdr lst))))))

(map-1 (lambda (x) (* x x))
       nums)

(define filter
  (lambda (f lst)
    (if (null? lst)
        '()
        (if (f (car lst))
            (cons (car lst)
                  (filter f (cdr lst)))
            (filter f (cdr lst))))))

(filter even? nums)



   