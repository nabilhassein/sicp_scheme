(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (iter guess)
      (if (good-enough? guess)
          guess
          (iter (improve guess))))
    (iter guess)))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1)
      (< (abs (- v1 (f v1))) tolerance))
  (define (try guess)
    (if (close-enough? guess)
        guess
        (try (f guess))))
  ((iterative-improve close-enough? try) first-guess))

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (square x) (* x x))
  (define (close? guess)
    (< (abs (- (square guess) x)) 0.001))
  ((iterative-improve close? improve) 1.0))