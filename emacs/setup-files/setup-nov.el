;; Configuration for nov.el(epub-reader)

;;; Code:
(use-package nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
)

(provide 'setup-nov)
