;; Configuration for magit(git-helper)

;;; Code:
(use-package magit
  :ensure t
  :bind
  ("C-c m s" . 'magit-status)
)

(provide 'setup-magit)
