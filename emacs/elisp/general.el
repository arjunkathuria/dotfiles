;;; Genral settings for emacs

;; tabs to spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;;undo-tree global
(global-undo-tree-mode 1)

;;Fix the scrolling to keep point in the center:
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)

;;Make tab key do indent first then completion.
(setq-default tab-always-indent 'complete)

;;Relevant Apropos
(setq apropos-sort-by-scores t)

;; Mp M-o to switch windows
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-O") 'universal-argument)

;; GLOBAL enabled modes and hooks
;;(require 'flycheck)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'prog-mode-hook 'vi-tilde-fringe-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;;----------------------

;; CUSTOM MAJOR MODES

;; adds js2-mode as the major mode for javscript shit.
;;(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;-------------------

(provide 'general)
