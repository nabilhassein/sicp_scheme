(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define tol 0.001)

(define (close? guess x)
  (< (abs (- guess
             (improve guess x)))
     (* guess tol)))

(define (sqrt-iter guess x)
  (if (close? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (root x) (sqrt-iter 1.0 x))
