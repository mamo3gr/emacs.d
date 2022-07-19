;;;; auto-highlight-symbol
(use-package auto-highlight-symbol
  :hook
  (after-init . global-auto-highlight-symbol-mode)
  :custom
  (ahs-case-fold-search nil "case sensitive when searching for a symbol")
  :bind
  ("M-n" . ahs-forward)
  ("M-p" . ahs-backward))
