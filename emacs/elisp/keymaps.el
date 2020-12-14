;; KEYMAPS


;; Map M-o to switch windows
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-O") 'universal-argument)

;; Maps M-i to imenu
(global-set-key (kbd "M-i") 'imenu)
(global-set-key (kbd "C-M-:") 'eval-buffer)

;; resize windows shortcuts
;; TODO: These make sense for windows on the left.
;; make them work as you'd expect for windows on the right for start

(global-set-key (kbd "C-<up>") 'shrink-window)
(global-set-key (kbd "C-<down>") 'enlarge-window)
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)

(use-package transpose-frame
  :ensure t
  :bind
  ("C-c f t" . 'transpose-frame))

(provide 'keymaps)
