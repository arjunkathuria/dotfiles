;; Configuration for smart-mode-line

;;; Code:

(use-package elpy
  :ensure t
  :commands elpy-enable
  :init (with-eval-after-load 'python (elpy-enable))
  :defer 2
  :config
    (elpy-enable)
    ;; jedi is great
    (setq elpy-rpc-backend "jedi")
    ;(electric-indent-local-mode -1)
    (delete 'elpy-module-highlight-indentation elpy-modules)
    (delete 'elpy-module-flymake elpy-modules)
  )


(provide 'setup-elpy)
