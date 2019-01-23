;; Configuration for elpy

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
    (setq highlight-indent-guides-method 'character)
    (electric-indent-local-mode -1)
    ;; indent guides from elpy weren't really working for me so,
    (delete 'elpy-module-highlight-indentation elpy-modules)
    ;; switch off flymake for flycheck
    (delete 'elpy-module-flymake elpy-modules)
  )


(provide 'setup-elpy)
