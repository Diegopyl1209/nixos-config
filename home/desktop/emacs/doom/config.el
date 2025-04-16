;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


(setq doom-theme 'doom-gruvbox)

(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")


;; Projectile
(after! projectile
  (setq projectile-switch-project-action #'projectile-dired)
  )

;; Dashboard
(use-package dashboard
  :bind (:map dashboard-mode-map
              ("j" . 'dashboard-next-line)
              ("k" . 'dashboard-previous-line)
              )
  :init
  (add-hook 'dashboard-mode-hook
            (lambda ()
              (setq show-trailing-whitespace nil)
              (solaire-mode -1)))
  :custom
  (dashboard-set-navigator t)
  (dashboard-center-content t)
  (dashboard-set-file-icons t)
  (dashboard-set-heading-icons t)
  (dashboard-image-banner-max-height 250)
  (dashboard-banner-logo-title "[Π Ο Σ Ε Ι Δ Ο Ν 🔱 Ε Δ Ι Τ Ο Ρ]") ; [Ποσειδον 🔱 εδιτορ]
  (dashboard-startup-banner "~/.config/doom/ue-colorful.png")
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-footer-icon (nerd-icons-codicon "nf-cod-calendar"
                                                  :height 1.1
                                                  :v-adjust -0.05
                                                  :face 'font-lock-keyword-face))
  (setq
   dashboard-projects-backend 'projectile
   dashboard-items '((recents        . 5)
                     (projects       . 2)
                     (bookmarks      . 5)
                     (agenda         . 3)
                     (registers      . 5)))
  :custom-face
 (dashboard-heading ((t (:foreground nil :weight bold)))));


;; Lsp
(use-package nix-ts-mode
 :mode "\\.nix\\'")
(add-hook 'nix-ts-mode-hook #'lsp! 'append)

;; Vterm
(use-package vterm)
