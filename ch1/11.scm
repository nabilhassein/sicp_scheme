(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))

(define (g n)
    (define (g-iter a b c count)
      ;; invariant: a = (f count), b = (f (+ count 1)), c = (f (+ count 2))
      (if (= count n)
          a
          (g-iter b
                  c
                  (+ c
                     (* 2 b)
                     (* 3 a))
                  (+ count 1))))
    (g-iter 0 1 2 0))
