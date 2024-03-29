(use-package pdf-tools
  :defer t
  ;; :straight (pdf-tools
  ;;            :type git
  ;;            :host github
  ;;            :repo "vedang/pdf-tools")
  :commands (pdf-view-mode pdf-tools-install)
  :mode ("\\.[pP][dD][fF]\\'" . pdf-view-mode)
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (pdf-view-display-size 'fit-page)
  (define-pdf-cache-function pagelabels)
  :hook ((pdf-view-mode-hook . (lambda () (display-line-numbers-mode -1)))
         (pdf-view-mode-hook . pdf-tools-enable-minor-modes)))

(use-package org-pdftools
  :defer t
  :hook (org-load-hook . org-pdftools-setup-link))

(provide 'setup-pdf)
