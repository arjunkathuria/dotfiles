;;; set gc limit

(setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 4096)

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ;; ("gnu-devel" . "https://elpa.gnu.org/devel/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(when (< emacs-major-version 27)
  (package-initialize))

;;Initialize paths in GUI mode

;; This sets $MANPATH, $PATH and exec-path from your shell,
;; but only when executed in a GUI frame on OS X and Linux.
(when (memq window-system '(mac ns x pgtk))
  (unless (package-installed-p 'exec-path-from-shell)
    (package-install 'exec-path-from-shell))
  (exec-path-from-shell-initialize))

;; Bootstrap 'use-package'
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(if (not (package-installed-p 'use-package))
    (package-install 'use-package))

;;Load Use-package
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;;(add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;; Load Files
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/setup-files/")
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))
;; REQUIRED PACKAGES


;; setup direnv with .envrc files
(require 'setup-direnv-envrc)

;; REQUIRED PACKAGES
(require 'setup-undo-tree)
(require 'setup-emmet)
;;(require 'setup-company)
(require 'setup-corfu)
(require 'setup-cape)

(require 'setup-web-mode)
(require 'setup-electric-pair-mode)

;;(require 'setup-prettier)

(require 'setup-flycheck)
;; (require 'setup-sml)
(require 'setup-all-the-icons)
(require 'setup-neotree)
(require 'setup-ace-window)
(require 'setup-whichkey)
(require 'setup-bm)
(require 'setup-whitespace-cleanup)
;;(require 'setup-alchemist)
;;(require 'setup-slime)

(require 'setup-elpy)
(require 'setup-lsp)
(require 'setup-haskell)
;;(require 'setup-nim)
(require 'setup-nov)
(require 'setup-magit)
(require 'setup-org)
(require 'setup-pdf)
(require 'setup-irc)

;; Convenience packages
(require 'setup-consult)
(require 'setup-embark)
(require 'setup-ctrlf)
(require 'setup-marginalia)
(require 'setup-vertico)

;; ;; OPTIONAL PACKAGES, chose to load on convenience
;; ;; these packages result in things mostly cosmetic.

(require 'setup-theme)
(require 'setup-dashboard)
;; (require 'setup-doom-modeline)

;; (require 'setup-miniframe)

;; GENERAL SETUP
(require 'general-emacs-setup)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-dired-monochrome nil)
 '(custom-safe-themes
   '("37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "b0e446b48d03c5053af28908168262c3e5335dcad3317215d9fdeb8bac5bacf9" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bc97a397933189a7b6cc7b859df0bccd1d744e31f2b0391e9ca311adcc7d2eab" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" default))
 '(fill-column 80)
 '(linum-format " %7i ")
 '(org-noter-notes-search-path
   '("~/Documents" "~/Documents/notes" "~/Documents/notes/books"))
 '(package-selected-packages
   '(diff-hl whitespace-cleanup-mode which-key hl-indent purp-theme zeno-theme green-is-the-new-black-theme minions consult-yasnippet yasnippet kind-icon cape corfu dante orderless vertico dhall-mode selectrum-prescient consult-company consult-dir consult-lsp line-reminder org-noter-pdftools org-noter timu-spacegrey-theme ox-hugo yaml-imenu yaml-mode visual-fill-column snazzy-theme embark-consult git-link oceanic-theme sketch-themes good-scroll mini-frame lsp-treemacs treemacs-projectile treemacs treemacs-all-the-icons treemacs-magit marginalia consult ctrlf shell-switcher selectrum hindent kaolin-themes hybrid-reverse-theme purescript-mode org-notifications org-roam side-hustle projectile vterm vterm-toggle rcirc-alert doom-modeline doom-themes multiple-cursors solarized-theme magit-org-todos org gnu-elpa-keyring-update circadian define-it org-alert org-link-beautify define-word org-bullets nov suggestion-box metronome transpose-frame lsp-mode immaterial-theme string-inflection paredit all-the-icons-dired all-the-icons-ibuffer lsp-haskell use-package lsp-ui company-statistics company-c-headers company-rtags flycheck-haskell haskell-mode elpy pipenv company-jedi all-the-icons dashboard exec-path-from-shell whole-line-or-region lorem-ipsum company-irony irony edts nordless-theme color-theme-sanityinc-tomorrow spacegray-theme dad-joke nord-theme bm markdown-mode flyspell-popup web-mode vi-tilde-fringe undo-tree rjsx-mode restart-emacs rainbow-mode rainbow-delimiters neotree material-theme magit json-mode js2-refactor git-gutter flycheck-pos-tip emmet-mode counsel company-web color-theme-sanityinc-solarized base16-theme ag ace-window))
 '(warning-suppress-types '((comp))))

(provide 'init)
;;; init.el ends here
