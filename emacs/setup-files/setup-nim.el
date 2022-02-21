(use-package nim-mode
  ;;:hook
  ;;(nim-mode . highlight-indentation-current-column-mode)
  :config
  (setq nimsuggest-path "c:/Users/Arjun/.nimble/bin/")


  ;; (highlight-indentation-mode 1)
  ;; Just an example, by default these functions are
  ;; already mapped to "C-c <" and "C-c >".
  (local-set-key (kbd "M->") 'nim-indent-shift-right)
  (local-set-key (kbd "M-<") 'nim-indent-shift-left)

  ;; Make files in the nimble folder read only by default.
  ;; This can prevent to edit them by accident.
  (when (string-match "/\.nimble/" (or (buffer-file-name) "")) (read-only-mode 1))
  )

(provide 'setup-nim)
