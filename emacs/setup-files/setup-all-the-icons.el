(use-package all-the-icons
  :defer t
  ;; Run the init initially only ONCE on a new system when you need to install the icon-fonts.
  ;; :init (all-the-icons-install-fonts)
  ;;:config
  )

(use-package all-the-icons-dired
  :after all-the-icons
  :hook
  ('dired-mode . 'all-the-icons-dired-mode)
  ;; :config
  ;; (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
  )

(provide 'setup-all-the-icons)
