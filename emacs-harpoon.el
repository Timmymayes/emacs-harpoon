  ;; ascii codes for registers
  ;; a = 97
  ;; s = 115
  ;; d = 100
  ;; f = 102

  (defvar
    active-harpoon)
  (setq active-harpoon 102)

  (defun current-buffer-is-harpooned (marker)
    (and (eq (marker-buffer marker) (current-buffer))))  

  (defun harpoon-f ()
    "Update point if in an a harpooned register and jump to the point harpooned in the 'f' register."
    (interactive)
    (if (current-buffer-is-harpooned (get-register active-harpoon)) (point-to-register active-harpoon))
    (jump-to-register 102)
    (setq active-harpoon 102))

  (defun set-harpoon-f ()
    "Harpoon the current buffer in the 'f' register"
    (interactive)
    (point-to-register 102)
    (setq active-harpoon 102)    
    )

  (defun harpoon-d ()
    "Update point if in an a harpooned register and jump to the point harpooned in the 'd' register."    
    (interactive)
    (if (current-buffer-is-harpooned (get-register active-harpoon)) (point-to-register active-harpoon))
    (jump-to-register 100)
    (setq active-harpoon 100))

  (defun set-harpoon-d ()
    "Harpoon the current buffer in the 'd' register"
    (interactive)
    (point-to-register 100)
    (setq active-harpoon 100)    
    )

  (defun harpoon-a ()
    "Update point if in an a harpooned register and jump to the point harpooned in the 'a' register."    
    (interactive)
    (if (current-buffer-is-harpooned (get-register active-harpoon)) (point-to-register active-harpoon))
    (jump-to-register 97)
    (setq active-harpoon 97))

  (defun set-harpoon-a ()
    "Harpoon the current buffer in the 'a' register"
    (interactive)
    (point-to-register 97)
    (setq active-harpoon 97)    
    )

  (defun harpoon-s ()
    "Update point if in an a harpooned register and jump to the point harpooned in the 'f' register."
    (interactive)
    (if (current-buffer-is-harpooned (get-register active-harpoon)) (point-to-register active-harpoon))
    (jump-to-register 115)
    (setq active-harpoon 115))

  (defun set-harpoon-s ()
    "Harpoon the current buffer in the 's' register"    
    (interactive)
    (point-to-register 115)
    (setq active-harpoon 115)
    )

  (global-set-key (kbd "H-a") 'harpoon-a)
  (global-set-key (kbd "H-s-a") 'set-harpoon-a)
  (global-set-key (kbd "H-s") 'harpoon-s)
  (global-set-key (kbd "H-s-s") 'set-harpoon-s)
  (global-set-key (kbd "H-d") 'harpoon-d)
  (global-set-key (kbd "H-s-d") 'set-harpoon-d)
  (global-set-key (kbd "H-f") 'harpoon-f)
  (global-set-key (kbd "H-s-f") 'set-harpoon-f)
