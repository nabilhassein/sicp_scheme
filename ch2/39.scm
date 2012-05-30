(define (foldr op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (foldr op initial (cdr sequence)))))

(define (foldl op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (r-reverse sequence)
  (foldr (lambda (x y) (append y (list x))) '() sequence))

(define (l-reverse sequence)
  (foldl (lambda (x y) (cons y x)) '() sequence))