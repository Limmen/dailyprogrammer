;run with M-x eval-buffer

(defun get_content (arg)
  (interactive "sEnter string to encrypt: ")
  arg)

(defun get_offset (arg)
  (interactive "sEnter offset")
  arg)

(defun encrypt (content)
  (mapcar '1+ content))

(setq content (call-interactively 'get_content))
;(message "content: %s" content)
;(setq shift (call-interactively 'get_offset))
(setq encrypted (encrypt content))
(message "encrypted string: %s " encrypted)


(mapcar (lambda (c) (char-to-string c)) "foobar")

;lambda is the symbol for an anonymous function, a function without a name.
;Every time you use an anonymous function, you need to include its whole body.
;mapcar is a function that calls its first argument with each element of its second argument, in turn.
;The second argument must be a sequence.
(mapcar (lambda (c) (< c 70) (+ c 5)) "foobar")

(char-to-string ?b)


