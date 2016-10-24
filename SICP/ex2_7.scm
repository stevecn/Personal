;; 2.1.4 Extended Exercise:Interval Arithmetic

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;; Todo:ensure this is right
(define (div-interval x y)
  (if (>= 0 (* (lower-bound y) (upper-bound y)))
    (error "error!" y)
    (mul-interval x
                  (make-interval
                    (/ 1.0 (upper-bound y))
                    (/ 1.0 (lower-bound y))))))

(define (make-interval a b) (cons a b))

;; Exercise:2.7

;; My version
;; (define (lower-bound interval) (car interval))
;; (define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (min (car interval)
                                    (cdr interval)))
(define (upper-bound interval) (max (car interval)
                                    (cdr interval)))

;; ???
;; Exercise:2.8 
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (display-interval i)
  (newline)
  (display "[")
  (display (lower-bound i))
  (display ",")
  (display (upper-bound i))
  (display "]"))

(define i (make-interval 1 5))
(define j (make-interval 1 4))

(display-interval i)
(display-interval (sub-interval i j))
(display-interval (sub-interval j i))

;; Exercise:2.9

(define (interval-width i)
  (/ (- (upper-bound i) (lower-bound i))
     2))

(interval-width (make-interval 2 8))

;; Exercise:2.10

(define (div-interval x y)
  (if (>= 0 (* (lower-bound y) (upper-bound y)))
    (error "error!" y)
    (mul-interval x
                  (make-interval
                    (/ 1.0 (upper-bound y))
                    (/ 1.0 (lower-bound y))))))

(define (make-interval a b) (cons a b))

(define span-0 (make-interval -1 2))

(display-interval (div-interval i j))
(display-interval (div-interval i span-0))

;; Exercise:2.11

