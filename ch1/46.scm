(define (iterative-improve good-enough? improve)
  (lambda (guess x)
    (define (iter guess x)
      (if (good-enough? guess x)
          guess
          (iter (improve guess x) x)))
  (iter guess x)))

(define tolerance 0.00001)

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (square x) (* x x))
  (define (close? guess x)
    (< (abs (- (square guess) x)) 0.001))
  ((iterative-improve close? improve) 1.0 x))

;; (define (fixed-point f first-guess)
;;   (