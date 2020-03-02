(use-package all-the-icons
  :ensure t
  :defer t
  ;; Run the init initially only ONCE on a new system when you need to install the icon-fonts.
  ;; :init (all-the-icons-install-fonts)
  :config
  (use-package all-the-icons-ivy
    :ensure t
    :after all-the-icons
    :init
    (all-the-icons-ivy-setup)
    )
  (use-package all-the-icons-dired
    :config
    (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
    )
  )

(provide 'setup-all-the-icons)
