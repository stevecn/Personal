(define x (cons (list 1 2) (list 3 4)))

(define (length x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (length (cdr x)) 1))))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(length x)
(count-leaves x)

;; Exercise 2.24
;; Length is wrong !!!
;; (car (cdr )) to get the left leaf

(define list-1 (list 1 (list 2 (list 3 4))))
(length list-1)
(count-leaves list-1)

;; Exercise 2.25
(car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))
(car (car (list (list 7))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))))))))))))

;; Exercise 2.26
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
(car (car (cons x y) ))
(car (car (list x y)))

(car (cdr (cons x y)))
(car (car (cdr (list x y))))

;; Exercise 2.27

!!! ;; Exercise2.18
(define (reverse items)
  (if (null? (cdr items))
    items
    (append (reverse (cdr items))
            (cons (car items) nil))))

(define (deep-reverse items)
  (if (null? (cdr items))
    (if (not (pair? (car items)))
      items
      (cons (deep-reverse (car items)) nil))
    (append (cond ((pair? (cdr items)) 
                   (deep-reverse (cdr items)))
                  ((pair? (car (cdr items)))
                   (cons (deep-reverse (car (cdr items))) nil))
                  ;; Some problem in else.
                  (else (deep-reverse (cdr items))))
            (cond ((pair? (car items))
                   (cons (deep-reverse (car items)) nil))
                  (else (cons (car items) nil))))))

(define y
  (list (list 1 2) (list 3 4) (list 5 6)))

(define z (list (list 1 2)))
(deep-reverse z)
(reverse z)

(reverse y)
(deep-reverse y)

(cons (deep-reverse (car (list (list 1 2)))) nil)

(deep-reverse 
  (list 1 (list 2 3) 4 (list 5 6)))

(define x
  (list (list 1 2) (list 3 4)))
(list (list 1 2) (list 3 4))
(reverse x)
(deep-reverse x)
(deep-reverse (list 3 4))
(deep-reverse (list 1 2 3))
(reverse (list 1 2 3))

;; Exercise2.28

(define (fringe items)
  (if (not (pair? items))
    (list items)
    (append (fringe (car items))
            (if (null? (cdr items))
              nil
              (fringe (cdr items))))))


(append (list 3) (list 4))
(append (list 4) nil)
(append nil (list 4))
(list 4)
(list 3 4)
(list nil)
(append (list nil) (list nil))

(define x
  (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
(list 1 2 3 4)
(list 1 2 3 4 1 2 3 4)

(append (list 2) (list 3))
(list 2 3)
(list (list 1 2) (list 3 4))
(list (list 1 2) 3 4)

;; Exercise2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car (mobile)))
(define (right-branch mobile)
  (cdr (mobile)))

(define branch-length)
