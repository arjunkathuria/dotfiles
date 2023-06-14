(use-package neotree
  ;; :after nerd-icons
  :bind
  ("C-c DEL" . neotree-toggle) ; DEL = bacspace
  :custom
   neo-theme (if (display-graphic-p) 'icons 'arrow)
   neo-autorefresh nil
   neo-mode-line-type 'neotree
   neo-window-width 25
   neo-banner-message nil
   neo-show-hidden-files nil
   neo-keymap-style 'concise
   neo-hidden-regexp-list
   '(;; vcs folders
     "^\\.\\(git\\|hg\\|svn\\)$"
     ;; compiled files
     ;;"\\.\\(pyc\\|o\\|elc\\|lock\\|css.map\\)$"
     ;; generated files, caches or local pkgs
     ;;"^\\(node_modules\\|vendor\\|.\\(project\\|cask\\|yardoc\\|sass-cache\\)\\)$"
     ;; org-mode folders
     ;;"^\\.\\(sync\\|export\\|attach\\)$"
     "~$"
     "^#.*#$")
  ;; :config
  ;; ()
)

(provide 'setup-neotree)
