(define (for-each proc xs)
  (if (null? xs)
      #t
      (begin
        (proc (car xs))
        (for-each proc (cdr xs)))))