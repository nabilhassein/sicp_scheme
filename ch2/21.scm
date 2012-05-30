(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car itmes))
            (square-list (cdr iterms)))))
(define (square-list-2 items)
  (map square items))