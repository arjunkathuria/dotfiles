;; Electric parit mode Configuration

;;; Code:
(add-hook 'prog-mode-hook 'electric-pair-mode)
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\' . ?\')
                            (?\` . ?\`)
                            (?\( . ?\))
                            (?\{ . ?\})
                            ) )

(provide 'setup-electric-pair-mode)
