(define (remainder-with-signal k n)
  (define (nontrivial? k n)
    (let ((r (modulo k n)))
      (not (or (= r 1) (= r (- n 1))))))
  (if (and (nontrivial? k n)
           (= 1 (remainder (square k) n)))
      0 ;; signal nontrivial square root of unity
      (remainder k n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder-with-signal (square (expmod base (/ exp 2) m))
                                m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
(define (square n)
  (* n n))

(define (miller-rabin? n)
  (define (iter a)
    (cond ((> a (/ n 2)) #t) ;; if n is composite, one of first n/2 will signal
          ((not (= 1 (expmod a (- n 1) n))) #f)
          (else (iter (+ a 1)))))
  (iter 2))
