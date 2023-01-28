;;;; exec-path-from-shell
;; ref:
;;   Emacsにシェルの環境変数をexec-path-from-shellで設定する - アナグマのモノローグ
;;   https://monologu.com/exec-path-from-shell-on-emacs/
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))
