(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

;; stack overflow for n > 450 so copy-pasted exercise 30 sum into this example
(define (simpson f a b n)
  (define h (/ (- b a)
               n))
  (define (inc k)
    (+ 1 k))
  (define (coef k)
    (cond ((or (= k 0) (= k n)) 1)
          ((odd? k) 4)
          (else 2)))
  (define (term k)
    (* (coef k)
       (f (+ a
             (* k h)))))
  (* (sum term 0 inc n)
     (/ h 3.0)))