(use-package neotree
  :after all-the-icons
  :bind
  ("C-c DEL" . neotree-toggle) ; DEL = bacspace
  :config
  (setq
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
          "^#.*#$"))

  ;; (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  ;; (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-stretch-toggle)
  ;; (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  ;; (evil-define-key 'normal neotree-mode-map (kbd "l") 'neotree-enter)
  ;; (evil-define-key 'normal neotree-mode-map (kbd "h") 'mymacs/neotree-collapse-or-up)
)

(provide 'setup-neotree)
