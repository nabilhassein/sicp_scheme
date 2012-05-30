(define (deep-reverse xs)
  (define (iter xs acc)
    (cond ((null? xs)
           acc)
          ((not (pair? (car xs)))
           (iter (cdr xs)
                 (cons (car xs)
                       acc)))
          (else
           (iter (cdr xs)
                 (cons (deep-reverse (car xs))
                       acc)))))
  (iter xs '()))