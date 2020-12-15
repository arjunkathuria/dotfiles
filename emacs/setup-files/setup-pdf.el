(use-package pdf-tools
  :defer t
  :ensure t
  ;; :init  (pdf-tools-install)
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  )

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
        TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(use-package org-pdftools
  :defer t
  :ensure t
  )

(provide 'setup-pdf)
