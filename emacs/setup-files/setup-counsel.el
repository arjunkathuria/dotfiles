;; Configuration for counsel, Ivy and Swiper

;;; Code:
(use-package counsel
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d ")
  (setq enable-recursive-minibuffers t)
  :bind
  (("C-s" . 'swiper)
   ("C-c C-r" . 'ivy-resume)
   ("M-x" . 'counsel-M-x)
   ("C-x C-f" . 'counsel-find-file)
   ("C-c g" . 'counsel-git)
   ("C-c j" . 'counsel-get-grep)
   ("C-c k" . 'counsel-ag)
   ("C-c l" . 'counsel-locate)
   )
)

(provide 'setup-counsel)
