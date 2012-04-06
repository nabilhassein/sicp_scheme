(define (fast-mult x y)
  (define (halve n)
    (/ n 2))
  (define (double n)
    (* n 2))
  (define (mult-iter a b n)
    ;; invariant: a + b*n == x*y
    (cond ((= n 0)
           a)
          ((odd? n)
           (mult-iter (+ a b)
                      b
                      (- n 1)))
          (else
           (mult-iter a
                      (double b)
                      (halve n)))))
  (mult-iter 0 x y))