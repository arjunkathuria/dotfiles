;; Configuration for counsel, Ivy and Swiper

;;; Code:

(use-package ivy
  :ensure t)

(use-package ivy-rich
  :ensure t
  :defer t)

(use-package all-the-icons-ivy-rich
  :ensure t
  :defer t
  :after all-the-icons
  )

(use-package counsel
  :init
  (ivy-mode 1)
  (ivy-rich-mode 1)
  (all-the-icons-ivy-rich-mode 1)
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
