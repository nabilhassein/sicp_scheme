;; I already know about filter
(define (same-parity x . xs)
  (let ((p (if (even? x)
               even?
               odd?)))
    (cons x (filter p xs))))

;; restricted to what is in book so far
(define (same-parity-2 x . xs)
  (define (same? n)
    (or (and (odd? x) (odd? n))
        (and (even? x) (even? n))))
  (define (iter list acc)
    (cond ((null? list)
           acc)
          ((same? (car list))
           (iter (cdr list) (cons (car list) acc)))
          (else
           (iter (cdr list) acc))))
  (reverse (iter xs (list x))))