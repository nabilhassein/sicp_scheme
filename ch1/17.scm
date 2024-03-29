(define (mult x y)
  (define (halve n)
    (/ n 2))
  (define (double n)
    (* n 2))
  (cond ((= y 0)
         0)
        ((even? y)
         (mult (double x) (halve y)))
        (else
         (+ x (mult x (- y 1))))))