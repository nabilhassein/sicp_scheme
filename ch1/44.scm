(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (define (id x) x)
  (if (< n 1)
      id
      (compose f (repeated f (- n 1)))))

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f (+ x dx))
                    (f x))
                 3)))

(define (n-smoothed f n)
  ((repeated smooth n) f))