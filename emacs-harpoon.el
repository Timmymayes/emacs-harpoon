;;; emacs-harpoon.el --- Rapid quick switching tool for buffers and files -*- lexical-binding: t; -*-

;; Copyright (C) 2022-2033 Tyler Mayes

;; Author: Tyler Mayes <timmymayes@gmail.com>
;; Version 0.1
;; Keywords: convenience frames 
;; Homepage: https://github.com/Timmymayes/emacs-harpoon
;; Package-Requires: ((emacs "27"))
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package works to merge marks and registers and/or bookmarks for quick file navigation.

;; It should hopefully evolve over time but for now comes with some restrictive setup as I learn
;; elisp and figure out what features I want the program to have.

;; For now the package utilizes registers a-f for quick switching.

;; There is a set of functions for setting harpoons in files and buffers and another set for
;; activating harpoons.

;; By default I have set these to:

;; Jump to active harpoons
;; 'H-a'  
;; 'H-s' 
;; 'H-d'  
;; 'H-f' 

;; Set new harpoons
;; 'H-s-a'
;; 'H-s-s'
;; 'H-s-d'
;; 'H-s-f'

;; Minimum improvements I hope to make:
;; 1. Incorporating bookmark option in addition to registers. Thanks Gavinok.
;; 2. Integration with Project.el and Projectile.el for profile persistent and independant saving
;; 3. Incorporate a proper key-map


;;; Code:

;; ascii codes for registers for
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
;;; emacs-harpoon.el ends here
