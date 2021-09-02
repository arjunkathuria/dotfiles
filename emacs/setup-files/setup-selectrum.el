;; Configuration for selectrum

;;; Code:
(use-package selectrum
  :ensure t
  :config
  (selectrum-mode)
  )

(use-package consult
  :ensure t
  :defer t
  :bind
  ("C-c s i" . consult-imenu)
  ("C-c s l" . consult-locate)
  ("C-c s G" . consult-grep)
  ("C-c s m" . consult-mark)
  ("C-c s g" . consult-git-grep)
  ("C-c s o" . consult-outline)

  :config

  )

(use-package ctrlf
  :ensure t
  :config
  (ctrlf-mode)
  )

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode)
  )

(provide 'setup-selectrum)
