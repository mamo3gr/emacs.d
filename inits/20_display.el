(use-package doom-themes
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  :custom-face
  (doom-modeline-bar ((t (:background "#6272a4"))))
  :config
  (load-theme 'doom-dracula t)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

;; 起動時のロゴを表示しない
(setq inhibit-startup-message t)
;; メニューバー・ツールバーを消す
(menu-bar-mode 0)
(tool-bar-mode 0)
;; 文字を折り返して表示しない
(setq truncate-lines t)
(setq truncate-partial-width-windows t)
;; 1行ずつスクロールする
(setq scroll-step 1)
;; yes/noをy-nにする
(fset 'yes-or-no-p 'y-or-n-p)

;;;; mode-line settings
;; show linefeed code
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

(use-package uniquify
  :custom
  (uniquify-buffer-name-style 'forward)  ;; dir/filename
  )

(set-face-attribute 'default nil :family "Myrica M" :height 130)
