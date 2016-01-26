;run with M-x eval-buffer

(defun ask_name (arg)
  "Prompt the user for a name"
  (interactive "sEnter you name: ")
  arg)

(defun ask_age (arg)
  "Prompt the user for age"
  (interactive "nEnter you age: ")
  arg)

(defun ask_username (arg)
  "Prompt the user for a username"
  (interactive "sEnter you username: ")
  arg)

;setq means "set quoted" and is short for: (set 'name (call-interactively 'ask_name))
;setq defines global variables
;'name is short for (quote name) which means "do not evaluate name; let it be the atom name"
(setq name (call-interactively 'ask_name))
(setq age (call-interactively 'ask_age))
(setq username (call-interactively 'ask_username))
(message "Your name is: %s \n Your age is: %d \n Your username is: %s" name age username)


