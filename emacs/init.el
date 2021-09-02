;;; set gc limit

(setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 4096)

(require 'package)

;; Add melpa and org sources

;; Orgmode.org/Elpa seems to be depreceated after 9.5, use regulat gnu org i guess ?
;; (add-to-list 'package-archives '("org"       . "https://orgmode.org/elpa/") t )
(add-to-list 'package-archives '("melpa"     . "https://melpa.org/packages/") t )

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

(require 'setup-undo-tree)
(require 'setup-emmet)
(require 'setup-company)
(require 'setup-web-mode)
(require 'setup-electric-pair-mode)
;;(require 'setup-counsel)
(require 'setup-selectrum)
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
(require 'setup-irc)
(require 'setup-theme)

;; ;; OPTIONAL PACKAGES, chose to load on convenience
;; ;; these packages result in things mostly cosmetic.

;; GENERAL SETUP
(require 'general-emacs-setup)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(all-the-icons-dired-monochrome nil)
;;  '(ansi-color-faces-vector
;;    [default bold shadow italic underline bold bold-italic bold])
;;  '(ansi-term-color-vector
;;    [unspecified "#151515" "#ff0086" "#00c918" "#aba800" "#3777e6" "#ad00a1" "#3777e6" "#d0d0d0"] t)
;;  '(beacon-color "#ff9da4")
;;  '(custom-safe-themes
;;    '("1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "a4127e6ce49d632c1b68881edec9d9e9e3289de31195934095aa1ec07fdc9094" "6193016c72612b8466b94da3005f2262512021071e63ab3de1e2745108bbbfe8" "b21fd6d881564e530ef64144a65ca4c0b9ead7ded28e90a9404e48d7e4e464d4" "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3" "a3bdcbd7c991abd07e48ad32f71e6219d55694056c0c15b4144f370175273d16" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "191bc4e53173f13e9b827272fa39be59b7295a0593b9f070deb6cb7c3745fd1d" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "6151e76f90a494363b167acdb0d36aada6d34c1843999523abe46764abb04179" "78c01e1b7f3dc9e47bdd48f74dc98dc1a345c291f83b68ac8a1b40191f24d658" "7220c44ef252ec651491125f1d95ad555fdfdc88f872d3552766862d63454582" "d5e13e2100e2a1167cd521558c5344809c154cc211ccd39a9c06bb83d254927c" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "bc99493670a29023f99e88054c9b8676332dda83a37adb583d6f1e4c13be62b8" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default))
;;  '(elpy-rpc-backend "jedi" t)
;;  '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
;;  '(flycheck-disabled-checkers '(json-jsonlist haskell-stack-ghc))
;;  '(flycheck-python-flake8-executable "python3")
;;  '(frame-background-mode 'dark)
;;  '(hl-paren-colors '("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11"))
;;  '(hl-sexp-background-color "#1c1f26")
;;  '(ivy-rich-mode t)
;;  '(linum-format " %7i ")
;;  '(lsp-ui-sideline-diagnostic-max-lines 6)
;;  '(objed-cursor-color "#e1c1ee")
;;  '(org-confirm-babel-evaluate nil)
;;  '(org-default-notes-file (concat org-directory "/notes.org"))
;;  ;;'(org-directory "D:/orgfiles")
;;  '(org-export-html-postamble nil)
;;  '(org-hide-leading-stars t)
;;  '(org-src-fontify-natively t)
;;  '(org-startup-folded 'overview)
;;  '(org-startup-indented t)

;;  '(pdf-view-midnight-colors (cons "#c6c6c6" "#282b33"))
;;  '(pos-tip-background-color "#DEDAD5")
;;  '(pos-tip-foreground-color "#4b5254")
;;  '(python-shell-interpreter "python3" t)
;;  '(tramp-syntax 'default nil (tramp))
;;  '(vc-annotate-background nil)
;;  '(vc-annotate-background-mode nil)
;;  '(vc-annotate-color-map
;;    '((20 . "#f36c60")
;;      (40 . "#ff9800")
;;      (60 . "#fff59d")
;;      (80 . "#8bc34a")
;;      (100 . "#81d4fa")
;;      (120 . "#4dd0e1")
;;      (140 . "#b39ddb")
;;      (160 . "#f36c60")
;;      (180 . "#ff9800")
;;      (200 . "#fff59d")
;;      (220 . "#8bc34a")
;;      (240 . "#81d4fa")
;;      (260 . "#4dd0e1")
;;      (280 . "#b39ddb")
;;      (300 . "#f36c60")
;;      (320 . "#ff9800")
;;      (340 . "#fff59d")
;;      (360 . "#8bc34a")))
;;  '(vc-annotate-very-old-color nil))
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
 '(custom-enabled-themes '(doom-nord))
 '(custom-safe-themes
   '("bc97a397933189a7b6cc7b859df0bccd1d744e31f2b0391e9ca311adcc7d2eab" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" default))
 '(linum-format " %7i ")
 '(package-selected-packages
   '(mini-frame-mode mini-frame lsp-treemacs treemacs-projectile treemacs treemacs-all-the-icons treemacs-magit marginalia consult ctrlf shell-switcher selectrum hindent subatomic-theme kaolin-themes hybrid-reverse-theme purescript-mode org-notifications org-roam side-hustle projectile apropospriate-theme dream-theme rustic vterm vterm-toggle rcirc-alert all-the-icons-ivy-rich-mode doom-modeline doom-themes zenburn-theme vscode-icon dracula-theme multiple-cursors solarized-theme magit-org-todos org gnu-elpa-keyring-update circadian dante define-it org-alert org-link-beautify define-word ivy-rich saveplace-pdf-view org-noter-pdftools undersea-theme org-pdftools org-pdfview org-bullets rainbow-delimiters-mode vi-tilde-fringe-mode nov pdf-tools pdf-view-restore pdfgrep suggestion-box metronome transpose-frame nim-mode lsp-ui-mode lsp-mode immaterial-theme string-inflection paredit all-the-icons-dired all-the-icons-ibuffer ebal lsp-haskell all-the-icons-ivy-rich use-package lsp-ui company-statistics company-c-headers company-rtags company-lsp flycheck-haskell haskell-mode elpy pipenv company-jedi all-the-icons-ivy slime-company brutalist-theme nofrils-acme-theme all-the-icons dashboard exec-path-from-shell whole-line-or-region lorem-ipsum company-irony irony edts nordless-theme color-theme-sanityinc-tomorrow company-erlang spacegray-theme overcast-theme dad-joke danneskjold-theme nord-theme erlang bm markdown-mode arjen-grey-theme flyspell-popup flycheck-elixir alchemist elixir-mode web-mode vi-tilde-fringe undo-tree surround rjsx-mode restart-emacs rainbow-mode rainbow-delimiters prettier-js osx-dictionary neotree material-theme magit json-mode js2-refactor gitconfig-mode git-gutter flycheck-pos-tip emmet-mode counsel company-web company-tern color-theme-sanityinc-solarized base16-theme ag ace-window))

(provide 'init)
;;; init.el ends here
