(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (define (id x) x)
  (if (< n 1)
      id
      (compose f (repeated f (- n 1)))))

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
            next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

(define (nth-root x n)
  (define (log2 x) (/ (log x) (log 2)))
  (define (damping-number n) (floor (log2 n))) ;; 2 for 4-7, 3 for 8-15, etc.
  (fixed-point ((repeated average-damp (damping-number n))
                (lambda (y) (/ x (expt y (- n 1))))) 1.0))
