(define (reverse xs)
  (define (iter xs acc)
    (if (null? xs)
        acc
        (iter (cdr xs)
              (cons (car xs) acc))))
  (iter xs '()))