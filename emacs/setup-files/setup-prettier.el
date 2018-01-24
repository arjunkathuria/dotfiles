;;; Prettier js config
;;; make sure to install prettier globally by npm.
;;; npm install -g prettier

(use-package prettier-js
  :hook (js2-mode js2-jsx-mode web-mode)
)

(provide 'setup-prettier)
