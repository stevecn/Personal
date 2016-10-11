(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point x) (cdr x))
(define (point-add x y)
  (make-point 
    (+ (x-point x) (x-point y))
    (+ (y-point x) (y-point y))))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
  (make-point 
    (/ (+ (x-point (start-segment segment))
          (x-point (end-segment segment)))
       2)
    (/ (+ (y-point (start-segment segment))
          (y-point (end-segment segment)))
       2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;Ex2-3 without abstraction barries;
(define point-a (make-point 1 3))
(define point-b (make-point 11 9))
(define segment-a (make-segment point-a point-b))
(define midpoint-a (midpoint-segment segment-a))
(print-point (make-point 1 2))
(print-point (end-segment segment-a))
(print-point (midpoint-segment segment-a))


(define (make-rectangle pointA pointB) (cons pointA pointB))

(define (right-top-point rectangle)
  (cdr rectangle))
(define (left-bottom-point rectangle)
  (car rectangle))

(define (calculate-perimeter rectangle)
  (* 2  (+ (- (y-point (right-top-point rectangle)) 
              (y-point (left-bottom-point rectangle)))
           (- (x-point (right-top-point rectangle)) 
              (x-point (left-bottom-point rectangle))))))

(define (calculate-area rectangle)
  (* (- (y-point (right-top-point rectangle)) 
        (y-point (left-bottom-point rectangle)))
     (- (x-point (right-top-point rectangle)) 
        (x-point (left-bottom-point rectangle)))))

(define rectangleA (make-rectangle point-a point-b))

(calculate-perimeter rectangleA)
(calculate-area rectangleA)

;Ex2-3 with abstraction barriers.
;Use left-bottom-point and right-top-point as abstraction barriers.

(define (make-rectangle pointA len width) 
  (cons pointA (cons len width)))

(define (left-bottom-point rectangle)
  (car rectangle))
(define (right-top-point rectangle)
  (make-point 
    (+ (x-point (car rectangle)) (car (cdr rectangle)))
    (+ (y-point (car rectangle)) (cdr (cdr rectangle)))))

(define (calculate-perimeter rectangle)
  (* 2  (+ (- (y-point (right-top-point rectangle)) 
              (y-point (left-bottom-point rectangle)))
           (- (x-point (right-top-point rectangle)) 
              (x-point (left-bottom-point rectangle))))))

(define (calculate-area rectangle)
  (* (- (y-point (right-top-point rectangle)) 
        (y-point (left-bottom-point rectangle)))
     (- (x-point (right-top-point rectangle)) 
        (x-point (left-bottom-point rectangle)))))

(define rectangleB (make-rectangle point-a 10 10))

(left-bottom-point rectangleB)
(right-top-point rectangleB)

(calculate-area rectangleB)
(calculate-perimeter rectangleB)
