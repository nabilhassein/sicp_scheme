(define (enumerate-interval x y)
  (if (> x y)
      '()
      (cons x (enumerate-interval (+ 1 x) y))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

