;; Electric parit mode Configuration

;;; Code:
(use-package electric-pair-mode
  :hook
  (prog-mode)
  :init
  (setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\' . ?\')
                            (?\` . ?\`)
                            (?\( . ?\))
                            (?\{ . ?\})
                            ) )
  )
(provide 'setup-electric-pair-mode)
