;; Configuration for counsel, Ivy and Swiper

;;; Code:

(use-package counsel
  :init
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d ")
  (setq enable-recursive-minibuffers t)
  
  :bind
  (
   ("C-c C-s" . 'swiper)
   ("C-c C-'" . 'swiper-avy)
   ("C-c C-r" . 'ivy-resume)
   ("M-x" . 'counsel-M-x)
   ("C-x C-f" . 'counsel-find-file)
   ("C-c g" . 'counsel-git)
   ("C-c j" . 'counsel-get-grep)
   ("C-c k" . 'counsel-ag)
   ("C-c l" . 'counsel-locate)
   ("C-c f" . 'counsel-file-jump)
   ("C-c SPC" . 'counsel-mark-ring)
   )
)

(provide 'setup-counsel)
