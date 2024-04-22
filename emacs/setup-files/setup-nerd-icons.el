(use-package nerd-icons
  ;; Run the init initially only ONCE on a new system when you need to install the icon-fonts.
  ;; :init (all-the-icons-install-fonts)
  ;;:config
  )

(use-package nerd-icons-dired
  :after nerd-icons
  :hook
  ('dired-mode . 'nerd-icons-dired-mode)
  ;; :config
  ;; (add-hook 'dired-mode-hook 'nerd-icons-dired-mode)
  ;; (add-hook 'dired-mode-hook #'nerd-icons-dired-mode)
  :custom
  (nerd-icons-ibuffer-mode 1)
  )

(use-package nerd-icons-completion
  :after nerd-icons
  :custom
  (nerd-icons-completion-mode 1))

(use-package nerd-icons-ibuffer
  :after nerd-icons
  :custom
  (nerd-icons-completion 1))

(use-package treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))

(provide 'setup-nerd-icons)
