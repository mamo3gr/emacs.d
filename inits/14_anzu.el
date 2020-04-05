;;;; anzu
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode 1)
  :bind
  ([remap query-replace] . anzu-query-replace)
  ([remap query-replace-regexp] . anzu-query-replace-regexp))
