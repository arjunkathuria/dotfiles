;; Haskell config Configuration

(defun haskell-ghc-tags ()
   "Use (buffer-file-name) and/or `default-directory` if necessary here."
   (let ((default-directory (haskell-cabal--find-tags-dir)))
     (shell-command "~/.cabal/bin/ghc-tags -e && echo TAGS Generated")))

;;; Code:
(use-package haskell-mode
  :bind
  ("C-c c" . 'haskell-compile)
  ("C-c h" . 'haskell-check)

  ;;:hook
  ;;interactive-haskell-mode

  :config
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook (lambda () (add-hook 'after-save-hook 'haskell-ghc-tags t)))

  :custom
  ;; set interactive haskell mode variable settings
  (haskell-process-suggest-remove-import-lines t)
  (haskell-process-auto-import-loaded-modules t)
  (haskell-process-log t)
  (haskell-process-prompt-restart-on-cabal-change t)
  (haskell-process-load-or-reload-prompt t)
  (haskell-process-suggest-hoogle-imports t)
  (haskell-process-type 'auto)
  (haskell-process-use-presentation-mode nil)
  (haskell-indent-offset 2)

  (haskell-process-args-cabal-repl '("--ghc-option=-ferror-spans" "--ghc-option=-Wall"))
  (haskell-process-args-ghci '("-ferror-spans" "-Wall"))
  (haskell-process-suggest-add-package nil)
  (haskell-process-suggest-hoogle-imports t)
  (haskell-tags-on-save t)
  (haskell-completing-read-function 'completing-read)
  (haskell-process-auto-import-loaded-modules nil)
  (haskell-process-suggest-haskell-docs-imports t)
  (haskell-process-suggest-hoogle-imports nil)
  (haskell-process-suggest-remove-import-lines nil)
  (haskell-process-use-presentation-mode t)
 )

(provide 'setup-haskell)
