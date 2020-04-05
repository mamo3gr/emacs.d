;;;; auto-highlight-symbol
(use-package auto-highlight-symbol
  :config
  (global-auto-highlight-symbol-mode t)
  :custom
  (ahs-case-fold-search nil)
  :bind
  ("M-n" . ahs-forward)
  ("M-p" . ahs-backward))
