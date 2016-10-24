(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else
            (error "Argument not 0 or 1:
                   CONS" m))))
  dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))

(define pair (cons 111 2))

(car pair)

;Exercise 2.4
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 1 2))

;Exercise 2.5
(define (cons x y) (* (pow 2 x) (pow 3 y)))

(define (pow x y)
  (if (= y 0) 
    1
  (* x (pow x (- y 1)))))


(define (car z)
 (if (not (= (modulo z 2) 0))
    0
    (+ (car (/ z 2)) 1)))
(define (cdr z)
  (if (not (= (modulo z 3) 0))
    0
    (+ (cdr (/ z 3)) 1)))

(car (cons 10 2))
(cdr (cons 1 119))

;Exercise 2.6

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
;; (add-1 zero)
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; (lambda (f) (lambda (x) (f (f x))))

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))
(define one (lambda(f) (lambda (x) (f x))))
(define two (lambda(f) (lambda (x) (f (f x)))))
(define three (lambda(f) (lambda (x) (f (f (f x))))))

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

;; Excellent answer for add a b, actually it's the
;; same compared with above imp.
(define (add a b)
  ((a add-1) b))

(zero 1)

(define (square x) (* x x))

((two square) 2)
((three square) 2)

(((add two one) square) 2)


