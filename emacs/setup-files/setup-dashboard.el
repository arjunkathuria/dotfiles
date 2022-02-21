(require 'dashboard)

;; Or if you use use-package
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startup-banner (concat user-emacs-directory "themes/catppuccin.png"))
  (dashboard-path-style 'truncate-beginning)
  (dashboard-banner-logo-title "Arjun's dashboard!")
  (dashboard-set-file-icons t)
  (dashboard-set-init-info t)
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)
  (dashboard-filter-agenda-entry 'dashboard-filter-agenda-by-time)
  (dashboard-week-agenda t)
  (dashboard-items '(
                    (projects . 5)
                    (agenda)
                    (recents . 3))
  ))

(provide 'setup-dashboard)
