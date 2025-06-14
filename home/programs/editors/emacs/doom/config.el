;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Diego Peña y Lillo"
      user-mail-address "diegopyl1209@gmail.com")

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2                             ; It's nice to maintain a little margin
      display-time-default-load-average nil)

(global-subword-mode 1)                           ; Iterate through CamelCase words


;; UI
(setq doom-theme 'doom-gruvbox)

(setq display-line-numbers-type 'relative)


;; Lsp

;; Disable invasive lsp-mode features
(after! lsp-mode
  (setq lsp-enable-suggest-server-download nil))

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil  ; no more useful than flycheck
        lsp-ui-doc-enable nil))     ; redundant with K


(add-hook! 'nix-mode-hook #'lsp!)


;; Languages
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))


;; Org
(setq org-directory "~/org/")
