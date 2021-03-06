;;;; ivy/counsel
(use-package ivy
  :diminish
  :hook
  (after-init . ivy-mode)
  :bind
  ("M-o" . swiper)
  ("C-c C-r" . ivy-resume)
  :custom
  (ivy-count-format "(%d/%d) "))

(use-package counsel
  :diminish
  :hook
  ;; invoke counsel-mode to remaps built-ins to counsel counterparts
  (ivy-mode . counsel-mode)
  :bind
  ([remap recentf-open-files] . counsel-recentf))

(use-package ivy-posframe
  :disabled t
  :config
  (ivy-posframe-mode 1)
  :custom
  (ivy-display-function-alist '((t . ivy-posframe-display)))
  )

(use-package all-the-icons-ivy-rich
  :hook
  (ivy-mode . all-the-icons-ivy-rich-mode)
  :custom
  (all-the-icons-ivy-rich-icon-size 0.7))

(use-package ivy-rich
  :hook
  (ivy-mode . ivy-rich-mode))
