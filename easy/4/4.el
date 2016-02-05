;run with M-x eval-buffer

(defun get_number_of_passwords (arg)
  (interactive "sEnter number of strings to encrypt")
  arg)


(defun pw_generator (length)
  (if (> length 0)
      (cons (random 127) (pw_generator (- length 1)))
    ()))


(setq n (string-to-number (call-interactively 'get_number_of_passwords)))
(setq passwords (pw_generator (+ (random 8) 8)))
(while (> n 0)
  (setq passwords (append passwords (pw_generator (+ (random 8) 8))))
  (setq n (- n 1)))

;concat returns a new string consisitng of characters in the arguments passed to it.
;The arugments may be strings, lists of numbers or vectors of numbers.
(message "passwords: %s" (concat passwords))
