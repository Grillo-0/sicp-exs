#!/usr/bin/guile
!#

(define (avrg a b) (/ (+ a b) 2))
(define (square x) (* x x))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
(define (sub-point a b) (make-point
		      (- (x-point a) (x-point b))
		      (- (y-point a) (y-point b))))

(define (make-segment start end) (cons start end))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (midpoint-segment s)
  (make-point
    (avrg (x-point (start-segment s)) (x-point (end-segment s)))
    (avrg (y-point (start-segment s)) (y-point (end-segment s)))))

(define (len-segment s)
  (let ((dist (sub-point (end-segment s) (start-segment s))))
    (sqrt (+ (square (x-point dist)) (square (y-point dist))))
  ))

(define (make-rect top-left bottom-right) (cons top-left bottom-right))
(define (top-left-rect r) (car r))
(define (bottom-right-rect r) (cdr r))

(define (bottom-left-rect r)
  (make-point
    (x-point (top-left-rect r))
    (y-point (bottom-right-rect r))))
(define (top-right-rect r)
  (make-point
    (x-point (bottom-right-rect r))
    (y-point (top-left-rect r))))

(define (width-rect r)
  (len-segment (make-segment (top-left-rect r) (bottom-left-rect r))))
(define (height-rect r)
  (len-segment (make-segment (top-left-rect r) (top-right-rect r))))

(define (perimeter-rect r) (* 2 (+ (width-rect r) (height-rect r))))
(define (area-rect r) (* (width-rect r) (height-rect r)))

(define origin (make-point 0 0))
(define point-a (make-point 4 2))
(define line (make-segment origin point-a))
(print-point (midpoint-segment line))
(newline)
(define rect (make-rect origin point-a))
(display (perimeter-rect rect))
(newline)
(display (area-rect rect))
(newline)
