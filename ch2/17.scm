(define (last-pair xs)
  (if (null? (cdr xs))
      xs
      (last-pair (cdr xs))))