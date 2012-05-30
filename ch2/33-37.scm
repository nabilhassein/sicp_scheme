;; given
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; exercise 33
(define (map p sequence)
  (accumulate (lambda (x xs) (cons (p x) xs))
              '()
              sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x xs) (+ 1 xs))
              0
              sequence))

;; exercise 34
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coef higher-terms) (+ this-coef (* higher-terms x)))
              0
              coefficient-sequence))

;; exercise 35
(define (enumerate-tree tree)
  (cond ((null? tree) ())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) 1)
                   (enumerate-tree t))))

;; exercise 36
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;; exercise 37
