(use-package org
  :ensure t
  :defer t
  :config
  (custom-set-variables
   (if (eq system-type 'windows-nt)
       '(org-directory "D:/orgfiles"))
   (if (eq system-type 'gnu/linux)
       '(org-directory "~/orgfiles"))
   ;;'(org-agenda-files (list org-directory))
   '(org-default-notes-file (concat org-directory "/notes.org"))
   '(org-export-html-postamble nil)
   '(org-hide-leading-stars t)
   '(org-startup-folded (quote overview))
   '(org-startup-indented t)
   '(org-confirm-babel-evaluate nil)
   '(org-src-fontify-natively t)
   )
  (load-library "find-lisp")
  (setq org-agenda-files (find-lisp-find-files org-directory "\**\.org$"))

  (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "BACKLOGED-FWD" "|" "DONE" "DIDNT-HAPPEN")))
  (setq org-todo-keyword-faces
        '(("TODO" . org-warning)
          ("DIDNT-HAPPEN" . (:foreground "yellow"))
          ("IN-PROGRESS" . "LightPink1")
        ))
  )

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setenv "BROWSER" "firefox")

(provide 'setup-org)
