#lang rosette

(require racket/help)

(define (f x) (+ x x))

(define-symbolic b boolean?)

(define-symbolic* n integer?)
 

(define (poly x)
 (+ (* x x x x) (* 6 x x x) (* 11 x x) (* 6 x)))
 
(define (factored x)
 (* x (+ x 1) (+ x 2) (+ x 2)))
 
(define (same p f x)
 (assert (= (p x) (f x))))

; Define a symbolic integer to use in comparing two functions.
(define-symbolic i integer?)

(define cex (verify (same poly factored i)))

(require rosette/query/debug rosette/lib/render)

;(define (poly x)
;  (+ (* x x x x) (* 6 x x x) (* 11 x x) (* 6 x)))

;(define/debug (factored x)       ; define/debug marks a procedure as part of
;  (* x (+ x 1) (+ x 2) (+ x 2))) ; the code to be debugged