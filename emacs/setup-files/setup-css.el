;; Configuration for CSS files

;;; Code:
(use-package css-mode
  :hook
  (css-mode . rainbow-mode)
  :custom
  (css-indent-offset 2)
)

(provide 'setup-css)
