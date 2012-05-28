(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; (add-1 zero) ==> (lambda (f) (lambda (x) (f ((zero f) x)))) ==> ...
(define one
  (lambda (f)
    (lambda (x)
      (f x))))
;;    (f ((lambda (x) x) x)))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

;; lifted from wikipedia "Church encoding"
(define (add m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))