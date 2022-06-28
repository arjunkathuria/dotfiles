;; Configuration for devdocs

;;; Code:
(use-package devdocs
  :init
  (add-hook 'python-mode-hook
            (lambda () (setq-local devdocs-current-docs '("python~3.10"))))

  (add-hook 'clojure-mode-hook
            (lambda () (setq-local devdocs-current-docs '("clojure~1.11"))))

  :bind
  (
   ("C-h D" . devdocs-lookup))
)

(provide 'setup-devdocs)
