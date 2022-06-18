;;Configuration for undo-tree package config

;;; Code:
(use-package undo-tree
  :config
  (global-undo-tree-mode 1)

  :custom
  (undo-tree-auto-save-history nil)
  (undo-tree-enable-undo-in-region t)
)

(provide 'setup-undo-tree)
;;;setup-undo-tree ends  here
