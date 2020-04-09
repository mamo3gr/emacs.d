;;;; vue-mode
(use-package vue-mode
  :hook
  ((vue-mode . company-mode)
   (vue-mode . smartparens-mode))
  :init
  ;; avoid identation problem
  ;;   Ref: https://qiita.com/akicho8/items/58c2ac5d762a2a4479c6
  (add-hook 'vue-mode-hook (lambda () (setq syntax-ppss-table nil))))
