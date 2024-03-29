(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (negative? d)
        (cons (* -1 (/ n g)) (* -1 (/ d g)))
        (cons (/ n g) (/ d g)))))

;; for testing
(define (numer x) (car x))
(define (denom x) (cdr x))