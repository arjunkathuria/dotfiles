;; Configuration for bm(visual-bookmarks)

;;; Code:
(use-package bm
  :ensure t
  :bind
  (("C-c =" . bm-toggle)
   ("C-c [" . bm-previous)
   ("C-c ]" . bm-next))
)

(provide 'setup-bm)
