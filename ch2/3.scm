(define make-point cons)
(define x-point car)
(define y-point cdr)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)


;; lower left and upper right corners as points OR as horizontal (bottom) segment and height -- same constructor due to runtime type test in accessors below
(define make-rectangle cons)

;; rather hackish solution to economize on code
(define (base r)
  (if (pair? (cdr r)) ;; representing as two points rather than segment and height
      (- (x-point (car r)) (x-point (cdr r)))
      (let ((s (car r)))
        (- (x-point (end-segment s))
           (x-point (start-segment s))))))

(define (height r)
  (if (pair? (cdr r)) ;; representing as two points rather than segment and height
      (- (y-point (car r)) (y-point (cdr r)))
      (cdr r)))

;; work with either representation
(define (perimeter r)
  (+ (* 2 (base r))
     (* 2 (height r))))

(define (area r)
  (* (base r) (height r)))