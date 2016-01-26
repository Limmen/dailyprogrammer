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


