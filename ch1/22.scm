;; guile has no (runtime)
;; subtracting sums of pair returned by (gettimeofday) works

(define (square n)
  (* n n))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (runtime)
  (let ((time (gettimeofday)))
    (+ (car time) (cdr time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes lower upper) ;; observed O(sqrt(n)) time, as expected
  (cond ((even? lower) (search-for-primes (- lower 1) upper))
        ((> lower upper) (display "\nSearch complete.\n"))
        (else (begin
                (timed-prime-test lower)
                (search-for-primes (+ lower 2) upper)))))