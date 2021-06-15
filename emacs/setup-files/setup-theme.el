;; Configuration for custom theme i use

;;; Code:
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;;(disable-theme 'tango)
  ;;(disable-theme 'kaolin-breeze)
  (setq dark-theme t)
  (load-theme 'doom-nord t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)

  ;; Corrects (and improvesx1) org-mode's native fontification.
  (doom-themes-org-config))


(provide 'setup-theme)
