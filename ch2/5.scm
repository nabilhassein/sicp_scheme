;; simple rather than efficient
(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (factor? k n)
  (integer? (/ n k)))

(define (car x)
  (if (factor? 2 x)
      (+ 1 (car (/ x 2)))
      0))

(define (cdr x)
  (if (factor? 3 x)
      (+ 1 (cdr (/ x 3)))
      0))