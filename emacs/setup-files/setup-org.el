(use-package org
  :ensure t
  :defer t
  :config
  (custom-set-variables)
  (load-library "find-lisp")

  :custom
  org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "BACKLOGED-FWD" "|" "DONE" "DIDNT-HAPPEN"))
  org-todo-keyword-faces
        '(("TODO" . org-warning)
          ("DIDNT-HAPPEN" . (:foreground "yellow"))
          ("IN-PROGRESS" . "LightPink1")
          )
  org-directory ((if (eq system-type 'windows-nt)
                     ("D:/orgfiles"))
                 (if (eq system-type 'gnu/linux)
                     ("~/orgfiles")))

   org-agenda-files (list org-directory)
   org-default-notes-file (concat org-directory "/notes.org")
   org-export-html-postamble nil
   org-hide-leading-stars t
   org-startup-folded (quote overview)
   org-startup-indented t
   org-confirm-babel-evaluate nil
   org-src-fontify-natively t
   org-agenda-files (find-lisp-find-files org-directory "\**\.org$")
  )

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;(setenv "BROWSER" "firefox")

(provide 'setup-org)
