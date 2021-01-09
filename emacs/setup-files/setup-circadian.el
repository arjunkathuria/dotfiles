(use-package circadian
  :config
  (use-package kaolin-themes
    :ensure t)
  (use-package base16-theme
    :ensure t)

  (setq calendar-latitude 28.6139)
  (setq calendar-longitude 77.2090)
  (setq circadian-themes '((:sunrise . wombat)
                           ("8:00"   . kaolin-breeze)
                           (:sunset  . adwaita)
                           ("20:00"  . tango)))
  (circadian-setup))

(provide 'setup-circadian)
;;; setup-circadian.el ends here
