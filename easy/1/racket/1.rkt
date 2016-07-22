;;;; run with `racket 1.rkt`
#lang racket

(define (ask_user Q)
  (display Q)
  (newline)
  (read-line (current-input-port) 'linefeed))

;(display "What is your name?")(newline)

(define Name (ask_user "What is your name?"))
(define Age (ask_user "What is your age?"))
(define User (ask_user "What is your reddit username?"))
(format "your name is ~a, you are ~a years old, and your username is ~a ~%" Name Age User)



