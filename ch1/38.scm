(define (cont-frac n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) acc)))))
  (iter k 0))

(define e
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i)
                  (if (= 2 (modulo i 3))
                      (* (+ i 1) (/ 2 3))
                      1))
                10))) ;; accurate to six decimal places