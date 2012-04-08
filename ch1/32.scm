(define (foldr op empty term a next b)
  (if (> a b)
      empty
      (op (term a)
          (foldr op empty term (next a) next b))))

(define (foldl op empty term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (op result (term a)))))
  (iter a empty))