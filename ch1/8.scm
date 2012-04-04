(define (square x) (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define tol 0.001)

(define (close? guess x)
  (< (abs (- guess
             (improve guess x)))
     (* guess tol)))

(define (cbrt-iter guess x)
  (if (close? guess x)
      guess
      (cbrt-iter (improve guess x) x)))

(define (cbrt x) (cbrt-iter 1.0 x))
