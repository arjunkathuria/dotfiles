;; Configuration for tree-sitter

;;; Code:
(use-package tree-sitter-langs)

(use-package tree-sitter
  :after tree-sitter-langs
  :config
  (global-tree-sitter-mode t)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(provide 'setup-tree-sitter)
