;; Configuration for custom theme i use

;;; Code:
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold nil)    ; if nil, bold is universally disabled
  (setq doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (setq doom-themes-padded-modeline t)

  ;; (setq dark-theme t)
  (load-theme 'doom-zenburn t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; Corrects (and improvesx1) org-mode's native fontification.
  (doom-themes-org-config))

(provide 'setup-theme)
