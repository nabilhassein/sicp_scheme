(define (cont-frac n d k)
  (define (iter i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (iter (+ i 1))))))
  (iter 1))

(tail-rec-cont-frac (lambda (x) 1.0)
                    (lambda (x) 1.0)
                    11) ;; correct to four decimal places

(define (tail-rec-cont-frac n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) acc)))))
  (iter k 0))