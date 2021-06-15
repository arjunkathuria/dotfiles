;; Configuration for irc client (ERC)

;;; Code:

(use-package erc
  :ensure t
  :custom
  (erc-autojoin-timing 'ident)
  ;;(erc-fill-function 'erc-fill-static)
  ;;(erc-fill-static-center 22)
  (erc)
  ;;(erc-hide-list '("JOIN" "PART" "QUIT"))
  ;;(erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
  ;;(erc-lurker-threshold-time 43200)
  (erc-prompt-for-nickserv-password nil)
  (erc-server-reconnect-attempts 5)
  (erc-server-reconnect-timeout 3)
  ;;(erc-track-exclude-types '("JOIN" "MODE" "NICK" "PART" "QUIT"
  ;;                           "324" "329" "332" "333" "353" "477"))
  :config
  (add-to-list 'erc-modules 'notifications)
  (add-to-list 'erc-modules 'spelling)
  (erc-services-mode 1)
  (erc-update-modules))

(defun erc-libera ()
  "Connect to Libera irc, plaintext connection."
  (interactive)
  (erc :server "irc.libera.chat" :port 6667 :nick "arjun"))

(defun erc-libera-tls ()
  "Connect to Libera irc, tls connection."

  (interactive)
  (erc-tls :server "irc.libera.chat" :port 6697 :nick "arjun"))

(provide 'setup-irc)
