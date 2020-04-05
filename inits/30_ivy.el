;;;; ivy/counsel
(use-package ivy
  :config
  (ivy-mode 1)
  :diminish
  :bind
  ("M-o" . swiper)
  ("C-c C-r" . ivy-resume)
  :custom
  (ivy-count-format "(%d/%d) "))

(use-package counsel
  :config
  ;; remaps built-in emacs functions that have counsel replacements
  (counsel-mode 1)
  :diminish
  :bind
  ([remap recentf-open-files] . counsel-recentf)
  ([remap yank-pop] . counsel-yank-pop)
  ([remap find-file] . counsel-find-file))

(use-package all-the-icons-ivy-rich
  :after ivy
  :config
  (all-the-icons-ivy-rich-mode 1)
  :custom
  (all-the-icons-ivy-rich-icon-size 0.7))

(use-package ivy-rich
  :after ivy
  :config
  (ivy-rich-mode 1))
