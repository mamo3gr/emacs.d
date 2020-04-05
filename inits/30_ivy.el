;;;; ivy/counsel
(use-package ivy
  :config
  (ivy-mode 1)
  :bind
  ("M-o" . swiper)
  ("C-c C-r" . ivy-resume)
  :custom
  (ivy-count-format "(%d/%d) "))

(use-package counsel
  :config
  ;; remaps built-in emacs functions that have counsel replacements
  (counsel-mode 1)
  :bind
  ([remap recentf-open-files] . counsel-recentf)
  ([remap yank-pop] . counsel-yank-pop)
  ([remap find-file] . counsel-find-file))
