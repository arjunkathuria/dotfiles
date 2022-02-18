(use-package org
  :ensure t
  :defer t
  :config
  (custom-set-variables)
  (load-library "find-lisp")
  (org-babel-do-load-languages
    'org-babel-load-languages
    '((haskell . t)))

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
                     ("~/Documents/org")))

   org-agenda-files (list (concat org-directory "/agenda/"))
   org-default-notes-file (concat org-directory "/notes/notes.org")
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

(use-package ox-hugo
  :ensure t            ;Auto-install the package from Melpa (optional)
  :after ox)

;;(setenv "BROWSER" "firefox")

(provide 'setup-org)
