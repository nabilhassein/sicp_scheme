(define make-mobile list)
(define make-structure list)

;; a
(define left-branch car)
(define right-branch cadr)

(define branch-length car)
(define branch-structure cadr)

;; b
(define (total-weight mobile)
  (let ((lb (branch-structure (left-branch mobile)))
        (rb (branch-structure (right-branch mobile))))
    (cond ((and (number? lb) (number? rb))
           (+ lb rb))
          ((number? lb)
           (+ lb (total-weight rb)))
          ((number? rb)
           (+ rb (total-weight lb)))
          (else
           (+ (total-weight lb) (total-weight rb))))))

;; c
(define (balanced? mobile)
  (define (torque branch)
    (let ((s (branch-structure branch))
          (l (branch-length branch)))
      (if (number? s)
          (* l s)
          (* l (torque s)))))
  (= (torque (left-branch mobile))
     (torque (right-branch mobile))))
       

;; d -- changing the representation like this leaves b and c totally unchanged
(define make-mobile-2 cons)
(define make-structure-2 cons)

(define left-branch-2 car)
(define right-branch-2 cdr)

(define branch-length-2 car)
(define branch-structure-2 cdr)