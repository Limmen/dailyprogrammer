;run with M-x eval-buffer
;Ask user for the string to encryp;
(defun get_content (arg)
  (interactive "sEnter string to encrypt: ")
  arg)
                                        ;

;Ask user for the offset
(defun get_offset (arg)
  (interactive "sEnter offset")
  arg)

;lambda is the symbol for an anonymous function, a function without a name.
;Every time you use an anonymous function, you need to include its whole body
;The second argument must be a sequence.
(defun encrypt (content &optional offset); optional is nil when not specified.
  (if offset
      (progn
        (mapcar (lambda (c) (if (< c (+ 65 offset))
                              (progn 
                                (- 123 (- offset (- c 65))))
                              (- c offset))) content))
  (progn
    (mapcar (lambda (c) (if (< c 70)
                          (progn 
                            (- 123 (- 5 (- c 65))))
                                                      (- c 5))) content))
  ))

;run commands
(setq content (call-interactively 'get_content))
(setq offset (call-interactively 'get_offset))
(setq encrypted (encrypt content (string-to-number offset)))
(message "encrypted string: %s " encrypted)
