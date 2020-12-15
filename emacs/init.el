;;; set gc limit

(setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 4096)

(require 'package)

(setq package-archives '(("org"       . "https://orgmode.org/elpa/")
                         ("gnu"       . "https://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap 'use-package'
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;Load Use-package
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;;(add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))
(setq use-package-always-ensure t)


;; Load Files
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/setup-files/")


;; REQUIRED PACKAGES

(require 'setup-emmet)

(require 'setup-company)
(require 'setup-web-mode)
(require 'setup-electric-pair-mode)
(require 'setup-counsel)
(require 'setup-prettier)

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
(require 'setup-nim)
(require 'setup-nov)
(require 'setup-magit)
(require 'setup-org)
(require 'setup-pdf)

;; OPTIONAL PACKAGES, chose to load on convenience
;; these packages result in things mostly cosmetic.

;; GENERAL SETUP
(require 'general-emacs-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(ansi-term-color-vector
   [unspecified "#151515" "#ff0086" "#00c918" "#aba800" "#3777e6" "#ad00a1" "#3777e6" "#d0d0d0"] t)
 '(beacon-color "#ff9da4")
 '(custom-enabled-themes '(base16-snazzy))
 '(custom-safe-themes
   '("6151e76f90a494363b167acdb0d36aada6d34c1843999523abe46764abb04179" "78c01e1b7f3dc9e47bdd48f74dc98dc1a345c291f83b68ac8a1b40191f24d658" "7220c44ef252ec651491125f1d95ad555fdfdc88f872d3552766862d63454582" "d5e13e2100e2a1167cd521558c5344809c154cc211ccd39a9c06bb83d254927c" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "bc99493670a29023f99e88054c9b8676332dda83a37adb583d6f1e4c13be62b8" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default))
 '(ebal-operation-mode 'stack)
 '(elpy-rpc-backend "jedi" t)
 '(fci-rule-color "#37474f")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(flycheck-disabled-checkers '(json-jsonlist haskell-stack-ghc))
 '(flycheck-python-flake8-executable "python3")
 '(frame-background-mode 'dark)
 '(hl-paren-colors '("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11"))
 '(hl-sexp-background-color "#1c1f26")
 '(jdee-db-active-breakpoint-face-colors (cons "#222228" "#819cd6"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#222228" "#5b94ab"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#222228" "#515462"))
 '(linum-format " %7i ")
 '(nil nil t)
 '(objed-cursor-color "#e1c1ee")
 '(org-agenda-files
   '("d:/orgfiles/December/week_2/09-12-2020.org" "d:/orgfiles/December/week_2/08-12-2020.org" "d:/orgfiles/December/week_2/07-12-2020.org" "d:/orgfiles/December/week_2/week_50.org" "d:/orgfiles/December/week_1/05-12-2020.org" "d:/orgfiles/December/week_1/04-12-2020.org" "d:/orgfiles/December/week_1/03-12-2020.org"))
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "D:/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-src-fontify-natively t)
 '(org-startup-folded 'overview)
 '(org-startup-indented t)
 '(package-selected-packages
   '(define-it org-alert org-link-beautify define-word ivy-rich saveplace-pdf-view org-noter-pdftools undersea-theme org-pdftools org-pdfview org-bullets rainbow-delimiters-mode vi-tilde-fringe-mode circe nov pdf-tools pdf-view-restore pdfgrep suggestion-box metronome kaolin-themes green-is-the-new-black-theme transpose-frame nim-mode lsp-ui-mode lsp-mode immaterial-theme string-inflection paredit all-the-icons-dired all-the-icons-ibuffer ebal lsp-haskell all-the-icons-ivy-rich use-package lsp-ui company-statistics company-c-headers company-rtags company-lsp flycheck-haskell haskell-mode elpy pipenv company-jedi all-the-icons-ivy slime-company brutalist-theme nofrils-acme-theme all-the-icons dashboard exec-path-from-shell whole-line-or-region lorem-ipsum company-irony irony edts nordless-theme color-theme-sanityinc-tomorrow company-erlang spacegray-theme overcast-theme dad-joke danneskjold-theme nord-theme erlang bm markdown-mode arjen-grey-theme flyspell-popup flycheck-elixir alchemist elixir-mode web-mode vi-tilde-fringe undo-tree surround rjsx-mode restart-emacs rainbow-mode rainbow-delimiters prettier-js osx-dictionary neotree material-theme magit json-mode js2-refactor gitconfig-mode git-gutter flycheck-pos-tip emmet-mode counsel company-web company-tern color-theme-sanityinc-solarized base16-theme ag ace-window))
 '(pdf-view-midnight-colors (cons "#c6c6c6" "#282b33"))
 '(pos-tip-background-color "#DEDAD5")
 '(pos-tip-foreground-color "#4b5254")
 '(python-shell-interpreter "python3" t)
 '(tramp-syntax 'default nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a")))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
