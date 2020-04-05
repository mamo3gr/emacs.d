;;;; anzu
(use-package anzu
  :config
  (global-anzu-mode 1)
  :diminish
  :bind
  ([remap query-replace] . anzu-query-replace)
  ([remap query-replace-regexp] . anzu-query-replace-regexp))
