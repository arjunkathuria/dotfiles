;; Configuration for mini-frame-mode

;;; Code:

(use-package mini-frame
  :custom
  (mini-frame-ignore-commands
   '(ctrlf-forward-default))
  (mini-frame-detach-on-hide nil)
  (mini-frame-show-parameters '((left . 0.5) (top . 0.25) (width . 0.5) (height . 1)))
  (resize-mini-frames t)
  (mini-frame-mode t)

)

(provide 'setup-miniframe)
;;; setup-miniframe ends here
