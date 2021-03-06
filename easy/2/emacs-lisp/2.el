;run with M-x eval-buffer

;Ask user for instructions
(defun start (arg)
  "Ask the user what he wants to know"
  (interactive "sWhat would you like to find? type f for force, m for mass or a for Acceleration ")
  arg)

;Ask user for acceleration
(defun ask_acc (arg)
  "Ask the user for acceleration"
  (interactive "nWhat is the acceleration? ")
  arg)

;Ask user for force
(defun ask_force (arg)
  "Ask the user for force"
  (interactive "nWhat is the force? ")
  arg)

;Ask user for mass
(defun ask_mass (arg)
  "Ask the user for mass"
  (interactive "nWhat is the mass? ")
  arg)

;Calculate the user's instructions
(defun find (choice)
  "Find the value that the user requested"
  (if (string= choice "f")
      (progn
        (setq acc (call-interactively 'ask_acc))
        (setq mass (call-interactively 'ask_mass))
        (setq res (* acc mass))
        (message "The force is: %d" res))
    (if (string= choice "m")
        (progn
          (setq acc (call-interactively 'ask_acc))
          (setq force (call-interactively 'ask_force))
          (setq res (/ force acc))
          (message "The mass is: %d" res))
      (progn
        (setq mass (call-interactively 'ask_mass))
        (setq force (call-interactively 'ask_force))
        (setq res (/ force mass))
        (message "The acceleration is: %d" res))
      )))

;run
(setq choice (call-interactively 'start))
(find choice)
