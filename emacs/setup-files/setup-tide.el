;; web-mode Configuration

;;; Code:
(use-package tide
  :init
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)
  ;; if you use typescript-mode
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  ;; if you use treesitter based typescript-ts-mode (emacs 29+)
  (add-hook 'typescript-ts-mode-hook #'setup-tide-mode)

  :config
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))

  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'tsx-ts-mode-hook #'setup-tide-mode))

(provide 'setup-tide)
