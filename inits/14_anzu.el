;;;; anzu
(use-package anzu
  :diminish
  :hook (after-init . global-anzu-mode)
  :custom-face
  (anzu-mode-line ((t (:foreground "DeepPink4"))))
  :bind
  ([remap query-replace] . anzu-query-replace)
  ([remap query-replace-regexp] . anzu-query-replace-regexp))
