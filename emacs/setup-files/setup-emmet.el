;; Emmet Configuration

;;; Code:
(use-package emmet-mode
  :hook
  (sgml-mode css-mode js2-jsx-mode)
  :init
  (setq emmet-expand-jsx-className? t)
  (setq emmet-self-closing-tag-style " /"))

(provide 'setup-emmet)
