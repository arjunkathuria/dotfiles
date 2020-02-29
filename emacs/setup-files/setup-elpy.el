;; Configuration for smart-mode-line

;;; Code:

(use-package elpy
  :ensure t
  :defer t
  :commands elpy-enable
  :init
  (with-eval-after-load 'python (elpy-enable))
  (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  :config
    (elpy-enable)
    ;; jedi is great
    ;(electric-indent-local-mode -1)
    (delete 'elpy-module-highlight-indentation elpy-modules)
    (delete 'elpy-module-flymake elpy-modules)
    :custom
    (elpy-rpc-backend "jedi")
  )


(provide 'setup-elpy)
