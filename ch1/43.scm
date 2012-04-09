(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (define (id x) x)
  (if (< n 1)
      id
      (compose f (repeated f (- n 1)))))
