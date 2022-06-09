;;; Genral settings for emacs

(use-package emacs
  :init
  ;; tabs to spaces
  (setq-default indent-tabs-mode nil)
  (setq tab-width 2)

  ;;Fix the scrolling to keep point in the center:
  (setq scroll-conservatively 10000
        scroll-preserve-screen-position t)

  ;;Make tab key do indent first then completion.
  (setq-default tab-always-indent 'complete)

  ;;Relevant Apropos
  (setq apropos-sort-by-scores t)

  ;; Font settings
  ;; set font-face
  (set-face-attribute 'default nil :font "Source Code Pro" :height 115)

  ;; Removes the side-scrollbars from emacs
  (scroll-bar-mode -1)
  (tool-bar-mode -1)

  ;; Disable the annoying splash screen (to enable it agin, replace the t with 0)
  (setq inhibit-splash-screen nil)

  (column-number-mode t)
  (line-number-mode t)

  ;; uniform encoding across systems.
  (set-language-environment "UTF-8")
  ;;(set-buffer-file-coding-system 'utf-8-unix)

  ;; windows set alt-gr (the right alt) as a normal alt.
  ;; (setq w32-recognize-altgr nil)

  ;; turn off backup files.
  (setq make-backup-files nil)
  (setq create-lockfiles nil)
  (setq auto-save-default nil)
  )

;;----------------------

;; CUSTOM MAJOR MODES

;; adds js2-mode as the major mode for javscript shit.
;;(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;-------------------

;; load keymaps
(require 'keymaps)

;;; setup calender with week numbers
(require 'calender)

(provide 'general-emacs-setup)
;;; general-emacs-setup.el ends here
