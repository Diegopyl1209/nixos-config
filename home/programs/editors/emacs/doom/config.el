;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


;; Settings

(setq user-full-name "Diego Peña y Lillo"
      user-mail-address "diegopyl1209@gmail.com")

(setq-default
 delete-by-moving-to-trash t
 window-combination-resize t
 x-stretch-cursor t)

(setq undo-limit 80000000
      evil-want-fine-undo t
      auto-save-default t
      truncate-string-ellipsis "…"
      password-cache-expiry nil
      ;; scroll-preserve-screen-position 'always
      scroll-margin 2
      display-time-default-load-average nil)

(global-subword-mode 1)


;; UI
(setq doom-theme 'doom-gruvbox)

(setq display-line-numbers-type 'relative)

;; Lsp

(after! lsp-mode
  (setq lsp-enable-suggest-server-download nil))

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil))


(add-hook! 'nix-mode-hook #'lsp!)

;; Languages
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; Org
(setq org-directory "~/org/")

;; Elfeed

(use-package! elfeed
  :bind (("C-x w" . elfeed)))

(use-package! elfeed-protocol
  :after elfeed
  :custom
  (elfeed-use-curl t)
  (elfeed-set-timeout 36000)
  (elfeed-protocol-fever-update-unread-only t)
  :config
  (elfeed-protocol-enable)
  (setq elfeed-protocol-feeds '(("fever+https://diegopyl1209@freshrss.diegopyl.me"
                                 :api-url "https://freshrss.diegopyl.me/api/fever.php"
                                 :password "123456789"))))
