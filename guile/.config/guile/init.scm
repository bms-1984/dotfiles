;;;; #init.scm was last modified on September 19, 2022 at 05:24 PM EDT by bms#
(use-modules (ice-9 colorized))
(activate-colorized)
(use-modules (ice-9 readline))
(activate-readline)
(use-modules (srfi srfi-1))

(define (prime? num)
  (cond
   ((or (= num 0) (= num 1)) #f)
   ((= num 2) #t)
   (else
    (null? (filter-map (lambda (x) (= (modulo num x) 0)) (range 2 (- num 1)))))))

(define (range first last)
  (if (< first last)
    (append (list first) (range (+ first 1) last))
    (list last)))
;;;; #end
