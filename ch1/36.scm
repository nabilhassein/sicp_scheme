(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess counter)
    (let ((next (f guess)))
      (display "Guess ")
      (display counter)
      (display ": ")
      (display guess)
      (newline)
      (if (close-enough? guess next)
          (begin
            (display "Final answer: ")
            (display next)
            (newline)
            next)
          (try next (+ 1 counter)))))
  (try first-guess 1))

(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

(define x-to-the-x
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))

(define x-to-the-x-damped
  (fixed-point (average-damp (lambda (x) (/ (log 1000) (log x)))) 2.0))

;; with tolerance = 0.00001, undamped takes 35 iterations, damped takes 10