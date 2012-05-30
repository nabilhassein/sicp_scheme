;; pre-defined
(define make-interval cons)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;; exercise 10
(define (div-interval x y)
  (if (and (<= (lower-bound y 0))
           (>= (upper-bound y 0)))
      (error "cannot divide by an interval spanning zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

;; exercise 7
(define (lower-bound i)
  (min (car i) (cdr i)))
(define (upper-bound i)
  (max (car i) (cdr i)))

;; exercise 8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;; exercise 9
;; proof that width of result of add-interval and sub-interval are functions only of width of arguments is trivial from their definitions: you add and subtract the widths
(define (width i)
  (/ (abs (- (upper-bound i)
             (lower-bound i)))
     2))

;; counterexample to similar claim for mul and div: all of these have width 1, but different widths for the three possible products
(define i1 (make-interval 0 1))
(define i2 (make-interval 10 11))
(define i3 (make-interval 100 101))

;; exercise 10 above; exercise 11 omitted

;; exercise 12
(define (make-center-width c w) 
  (make-interval (- c w) (+ c w)))

(define (center i) 
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (* c p .01)))
    (make-interval (- c w) (+ c w))))

(define (percent i)
  (* 100. (/ (width i)
            (center i))))

;; exercises 13-16 omitted