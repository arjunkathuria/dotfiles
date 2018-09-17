;; Configuration for ace-window

;;; Code:
(use-package ace-window
  :init ()
  :bind (
         ("C-c o" . 'ace-window))
  :ensure t
)

(provide 'setup-ace-window)
