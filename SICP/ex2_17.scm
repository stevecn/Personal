(cons 1
      (cons 2
            (cons 3
                  (cons 4 nil))))

(define one-through-four (list 1 2 3 4))

one-through-four

(car one-through-four)
(cdr one-through-four)

(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items)
              (- n 1))))

(list-ref one-through-four 3)

(define (length items)
  (if (null? items)
    0
    (+ 1 (length (cdr items)))))

(define (length items)
  (define (length-iter a count)
    (if (null? a)
      count
      (length-iter (cdr a)
                   (+ 1 count))))
  (length-iter items 0))

(define odds (list 1 3 5 7))
(define squares (list 1 4 9 16 25))

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1)
          (append (cdr list1)
                  list2))))

(append odds squares)

;; Exercise2.17
(define (last-pair items)
  (if (null? (cdr items))
    (car items)
    (last-pair (cdr items))))

(last-pair (list 1 2 3 4 9 23))

;; Exercise2.18
(define (reverse items)
  (if (null? (cdr items))
    items
    (append (reverse (cdr items))
            (cons (car items) nil))))

(list 4 3 2 1)
(reverse (list 1 2 3 4))

;; Exercise2.19 Counting change

(define (count-change amount)
  (cc amount 5))

(define us-coins
  (list 50 25 10 5 1))
(define uk-coins
  (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0)
        1)
        ((or (< amount 0)
             (no-more? coin-values))
         0)
        (else
          (+ (cc
               amount
               (except-first-denomination
                 coin-values))
             (cc
               (- amount
               (first-denomination
                 coin-values))
             coin-values)))))

(define (first-denomination coin-values)
  (car coin-values))
(define (no-more? coin-values)
  (null? coin-values))
(define (except-first-denomination coin-values)
  (if (null? coin-values)
    null?
    (cdr coin-values)))

(cc 100 us-coins)

;; Exercise2.20

(define (same-parity x . y)
  (define (find-same-parity parity z)
    (if (null? z)
      nil
      (if (= parity 1)
        (if (odd? (car z))
          (cons (car z) (find-same-parity 1 (cdr z)))
          (find-same-parity 1 (cdr z)))
        (if (even? (car z))
          (cons (car z) (find-same-parity 2 (cdr z)))
          (find-same-parity 2 (cdr z))))))
  (if (odd? x)
    (cons x (find-same-parity 1 y))
    (cons x (find-same-parity 2 y))))

(define (same-parity first . rest)
  (define (same-parity-iter source dist remainder-val)
    (if (null? source)
      dist
      (same-parity-iter (cdr source)
                        (if (= (remainder (car source) 2) remainder-val)
                          (append dist (list (car source)))
                          dist)
                        remainder-val)))
  (same-parity-iter rest (list first) (remainder first 2)))
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)

;; Exercise2.21
(define (map proc items)
  (if (null? items)
    nil
    (cons (proc (car items))
          (map proc (cdr items)))))

(define (squares items)
  (map (lambda (x) (* x x)) items))
(squares (list 1 2 3 4))
