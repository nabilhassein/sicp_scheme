(define (exponent base power)
  (define (square x)
    (* x x))
  (define (expt-iter a b n)
    ;; invariant: a * b^n == base ^ power
    (cond ((= n 0)
           a)
          ((odd? n)
           (expt-iter (* a b)
                      b
                      (- n 1)))
          (else
           (expt-iter a
                      (square b)
                      (/ n 2)))))
  (expt-iter 1 base power))
