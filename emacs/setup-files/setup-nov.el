;; Configuration for nov.el(epub-reader)

;;; Code:
(use-package nov
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
)

(provide 'setup-nov)
