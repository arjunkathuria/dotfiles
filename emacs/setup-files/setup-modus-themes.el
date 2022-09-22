;; Configuration for custom theme i use

;;; Code:
(use-package modus-themes
  :ensure
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-syntax '(alt-syntax green-strings))
  (modus-themes-mode-line '(moody accented borderless))
  (modus-themes-tabs-accented t)

  (modus-themes-completions
      '((matches . (extrabold background))
        (selection . (semibold accented))
        (popup . (accented))))

  (modus-themes-fringe 'subtle)
  (modus-themes-lang-checkers '(text-also straight-underline))
  (modus-themes-hl-line '(accented))
  (modus-themes-subtle-line-numbers t)
  (modus-themes-markup '(bold italic))
  (modus-themes-paren-match '(bold))
  (modus-themes-region '())

  :config
  (load-theme 'modus-operandi)
  (load-theme 'modus-operandi)

  (enable-theme 'modus-operandi))

(provide 'setup-modus-themes)
;;; setup-modus-themes.el ends here
