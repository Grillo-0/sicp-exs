#!/usr/bin/env guile
!#

(define zero
  (lambda (f)
    (lambda (x)
      x)))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

(define (add a b)
  (lambda (f)
    (lambda (x)
    ((a f) ((b f) x))
    )))

(define three (add two one))

(define (show-num n)
  ((n
     (lambda (x) (string-append "f(" x ")")))
   "x"))

(define (get-num n)
  ((n
     (lambda (x) (+ x 1)))
     0))

(define (display-num n)
  (display (show-num n))
  (display " = ")
  (display (get-num n))
  (newline))

(display-num zero)
(display-num one)
(display-num two)
(display-num (add-1 two))
(display-num (add two one))
(display-num (add two two))
(display-num (add two three))
