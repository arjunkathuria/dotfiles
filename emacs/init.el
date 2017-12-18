

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;;; set gc limit

(setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 4096)

(require 'package)

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)
;;;(package-refresh-contents)

;; tabs to spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;;undo-tree global
(global-undo-tree-mode 1)

;;Fix the scrolling to keep point in the center:
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)

;;Make tab key do indent first then completion.
(setq-default tab-always-indent 'complete)

;;Relevant Apropos
(setq apropos-sort-by-scores t)

;; Mp M-o to switch windows
(global-set-key (kbd "M-o") 'other-window)

 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; CUSTOM MAJOR MODES

;; adds js2-mode as the major mode for javscript shit.
;;(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;-------------------

;; web-mode config

(setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2) ; web-mode
(setq js-indent-level 2)
(setq js2-basic-offset 2) ; js2-mode
(setq css-indent-offset 2) ; css-mode

;; Adds jsx support to web mode
(defun my-load-jsx ()
  (when (and (stringp buffer-file-name)
         (string-match "\\.js\\'" buffer-file-name))
        (web-mode-set-content-type "jsx")))

(add-hook 'find-file-hook #'my-load-jsx)

;;---------------------

;; Emmet settings

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation
(setq emmet-expand-jsx-className? t)
(setq emmet-self-closing-tag-style " /")

;;---------------------


;; GLOBAL enabled modes and hooks
(require 'flycheck)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'prog-mode-hook 'vi-tilde-fringe-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;;----------------------

;;FLYCHECK LINTERS
;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)


;; Neotree configurations
(global-set-key [f8] 'neotree-toggle)

;;-----------------------

;; Company mode Configs;
(require 'company)
(require 'company-web-html)                          ; load company mode html backend
(add-to-list 'company-backends 'company-tern)

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key
;;-----------------------

;; Emmet Mode Config
(add-to-list 'load-path "~/emacs.d/emmet-mode")
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;;-----------------------

;; electric pair mode
(electric-pair-mode 1)
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\' . ?\')
                            (?\` . ?\`)
                            (?\( . ?\))
                            (?\{ . ?\})
                            ) )
;; Ivy, counsel, swipper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t
      ivy-count-format "%d/%d ")
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
;;------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-term-color-vector
   [unspecified "#1b2b34" "#ec5f67" "#99c794" "#fac863" "#6699cc" "#c594c5" "#6699cc" "#c0c5ce"] t)
 '(company-backends
   (quote
    (company-tern company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev company-ispell)))
 '(custom-enabled-themes (quote (base16-oceanicnext)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" default)))
 '(emmet-indentation 2)
 '(fci-rule-color "#373b41")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(global-subword-mode t)
 '(global-visual-line-mode t)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(package-selected-packages
   (quote
    (counsel google-this gotham-theme govet darktooth-theme rjsx-mode emmet-mode gitconfig-mode github-modern-theme haskell-mode ghc base16-theme prettier-js osx-dictionary material-theme company-go ace-window go-mode projectile rainbow-delimiters restart-emacs git-gutter vi-tilde-fringe flycheck flycheck-pos-tip neotree indium js2-mode js2-refactor json-mode magit web-mode company-tern company-web company rainbow-mode yasnippet undo-tree surround monokai-alt-theme color-theme-sanityinc-solarized ag abyss-theme)))
 '(sentence-end-double-space nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil)
 '(winner-mode t))
