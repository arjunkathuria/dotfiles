(use-package nerd-icons
  ;; Run the init initially only ONCE on a new system when you need to install the icon-fonts.
  ;; :init (all-the-icons-install-fonts)
  ;;:config
  )

(use-package nerd-icons-dired
  :after nerd-icons
  :hook
  ('dired-mode . 'nerd-icons-dired-mode)
  :config
  (add-hook 'dired-mode-hook 'nerd-icons-dired-mode)
  (add-hook 'dired-mode-hook #'nerd-icons-dired-mode)
  )

(provide 'setup-nerd-icons)
