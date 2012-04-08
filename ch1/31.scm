;; (a) an iterative process (tail-recursive procedure)
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (define (id x) x)
  (define (inc x) (+ 1 x))
  (product id 1 inc n))

(define (pi-approx n)
  (define (term k)
    (/ (* (- k 1) (+ k 1))
       (* k k)))
  (define (next k) (+ 2 k))
  (* 4.0 (product term 3 next n)))

;; (b) recursive process sans tail recursion in case you dislike efficiency
(define (i-product term a next b)
  (if (> a b)
      1
      (* (term a)
         (i-product term (next a) next b))))