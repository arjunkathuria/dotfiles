;; Configuration for ispell

(use-package ispell
  :init
  (setq-default
   ispell-program-name "hunspell"
   ispell-dictionary "en_US"))

(provide 'setup-flyspell)

(provide 'setup-ispell)
