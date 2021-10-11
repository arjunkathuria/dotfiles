;; Configuration for selectrum

;;; Code:
(use-package selectrum
  :ensure t
  :config
  (selectrum-mode))

(use-package ctrlf
  :ensure t
  :config
  (ctrlf-mode))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(provide 'setup-selectrum)
