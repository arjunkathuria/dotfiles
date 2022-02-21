;; Configuration for bm(visual-bookmarks)

;;; Code:
(use-package bm
  :bind
  (("C-c =" . bm-toggle)
   ("C-c [" . bm-previous)
   ("C-c ]" . bm-next))
)

(provide 'setup-bm)
