;; Company Configuration

;;; Code:
(use-package company
  :ensure t
  ;; (add-hook 'prog-mode-hook 'company-mode)
  ;; (add-hook 'comint-mode-hook 'company-mode)

  :bind
  ("C-c C-SPC" . 'company-complete)
  
  :init
  (global-company-mode)

  :config
  (setq company-tooltip-limit 10)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.2)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  ;; (setq company-tooltip-flip-when-above t)
  (setq company-transformers '(company-sort-by-occurrence)) ; weight by frequency

  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous)

  (use-package company-web
    :ensure t
    :hook (web-mode)
    :bind (("C-c w" . company-web-html))
    :config
    (add-to-list 'company-backends 'company-web-html))

  ;; (use-package company-lsp
  ;;   :ensure t
  ;;   :defer t
  ;;   :config
  ;;   (add-to-list 'company-backends 'company-lsp))

  ;; (use-package company-rtags
  ;;   :defer t
  ;;   :config
  ;;   (add-to-list 'company-backends 'company-rtags))

  ;; (use-package company-c-headers
  ;;   :defer t
  ;;   :config
  ;;   (add-to-list 'company-backends 'company-c-headers))
  
  (use-package company-statistics
    :ensure t
    :config
    (add-hook 'after-init-hook 'company-statistics-mode))

  (use-package company-jedi
    :ensure t
    :init
    (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
    (setq company-jedi-python-bin "python3")
    (setq python-shell-interpreter "python3"))

  (add-hook 'haskell-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '((company-capf company-dabbrev-code))
                         company-backends))))
  )

(provide 'setup-company)
