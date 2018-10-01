;;; set gc limit

(setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 4096)

(require 'package)

(setq package-archives '(("org"       . "https://orgmode.org/elpa/")
                         ("gnu"       . "https://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

;;(package-initialize)

;;; Load Use-package
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;;(add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;;; Load Files
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/setup-files/")

(require 'general)

(require 'setup-emmet)
(require 'setup-company)
(require 'setup-web-mode)
(require 'setup-electric-pair-mode)
(require 'setup-counsel)
(require 'setup-prettier)
(require 'setup-alchemist)
(require 'setup-bm)
(require 'setup-whichkey)
(require 'setup-flycheck)
(require 'setup-sml)

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
 '(custom-enabled-themes '(base16-oceanicnext))
 '(custom-safe-themes
   '("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default))
 '(fci-rule-color "#37474f")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(hl-paren-colors '("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11"))
 '(hl-sexp-background-color "#1c1f26")
 '(linum-format " %7i ")
 '(package-selected-packages
   '(sml smart-mode-line exec-path-from-shell all-the-icons-dired all-the-icons-ivy whole-line-or-region lorem-ipsum sublime-themes company-irony irony cmake-ide cmake-mode company-c-headers company-rtags rtags edts nordless-theme color-theme-sanityinc-tomorrow company-erlang spacegray-theme overcast-theme dad-joke danneskjold-theme nord-theme erlang bm which-key markdown-mode arjen-grey-theme flyspell-popup flycheck-elixir alchemist elixir-mode web-mode vi-tilde-fringe use-package undo-tree surround rjsx-mode restart-emacs rainbow-mode rainbow-delimiters projectile prettier-js osx-dictionary neotree monokai-alt-theme material-theme magit json-mode js2-refactor indium govet gotham-theme google-this github-modern-theme gitconfig-mode git-gutter ghc flycheck-pos-tip emmet-mode counsel company-web company-tern company-go color-theme-sanityinc-solarized base16-theme ag ace-window))
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
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
