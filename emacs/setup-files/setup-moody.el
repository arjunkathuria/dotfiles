(use-package moody
      :config
      (setq x-underline-at-descent-line t)
      (moody-replace-sml/mode-line-buffer-identification)
      (moody-replace-vc-mode)
      )

(use-package minions
  :ensure t
  :init (minions-mode t)
)

(provide 'setup-moody)
