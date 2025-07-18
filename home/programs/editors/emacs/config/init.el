;; -*- lexical-binding: t;-*-

;; Packages

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         (or (bound-and-true-p straight-base-dir)
                             user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq package-enable-at-startup nil)
(setq straight-use-package-by-default t)

(use-package auto-package-update
  :ensure t
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "20:00"))

(setq use-package-always-defer t)
(setq use-package-always-ensure t)

(when (native-comp-available-p)
  (setq native-comp-speed 2)
  (setq native-comp-async-report-warnings-errors nil)
  (add-to-list 'native-comp-eln-load-path
               (expand-file-name "eln-cache/" user-emacs-directory)))

;; Settings

(setq-default electric-indent-inhibit t)
(setq ring-bell-function 'ignore)
(setq select-enable-clipboard t)
(setq-default cursor-type 'bar)
(setq scroll-step 1
      scroll-conservatively 10000)

(global-auto-revert-mode t)
(setq-default truncate-lines t)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(setq redisplay-dont-pause t)
(setq vc-follow-symlinks t)

(setq auto-save-list-file-prefix "~/.config/emacs/autosave/")
(setq auto-save-file-name-transforms
      '((".*" "~/.config/emacs/autosave/" t)))
(setq backup-directory-alist
      `(("." . ,(expand-file-name "~/.config/emacs/backups" user-emacs-directory))))
(setq create-lockfiles nil)
(setq user-emacs-directory (expand-file-name "~/.cache/emacs"))

(desktop-save-mode 1)
(unless (file-directory-p "~/.config/emacs/desktop/")
  (make-directory "~/.config/emacs/desktop/" t))
(setq desktop-path '("~/.config/emacs/desktop/"))
(setq desktop-dirname "~/.config/emacs/desktop/")
(setq desktop-base-file-name "emacs-desktop")

;; Keybindings

(windmove-default-keybindings)

(defun my/escape-dwim ()
  "Cancel company completion if active, otherwise run `keyboard-escape-quit'."
  (interactive)
  (cond
   ((and (boundp 'company-mode) company-candidates)
    (company-abort))
   (t
    (keyboard-escape-quit))))

(global-set-key (kbd "<escape>") #'my/escape-dwim)
(global-set-key (kbd "s-d") 'eldoc-box-help-at-point)
(global-set-key (kbd "M-SPC") 'company-complete)
;; (global-set-key "\M-h" 'help-for-help)
;; (global-set-key (kbd "C-q") 'other-window)
;; (global-set-key (kbd "C-k") 'enlarge-window)
;; (global-set-key (kbd "C-i") 'shrink-window)
;; (global-set-key (kbd "C-l") 'enlarge-window-horizontally)
;; (global-set-key (kbd "C-j") 'shrink-window-horizontally)
;; (global-set-key (kbd "C-c y") 'company-yasnippet)
;; ;; (global-unset-key (kbd "C-z"))
;; (global-set-key (kbd "C-=") 'text-scale-increase)
;; (global-set-key (kbd "C--") 'text-scale-decrease)
;; (global-set-key (kbd "C-0") 'text-scale-adjust)
;; (global-set-key (kbd "C-c h") 'hs-hide-block)
;; (global-set-key (kbd "C-c s") 'hs-show-block)
;; (global-set-key (kbd "C-c C-r") 'lsp-rename)


;; Appareance

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
;;(setq-default display-fill-column-indicator-column 79)
;;(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(setq use-dialog-box nil)
(display-time-mode 1)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(use-package nerd-icons
  :ensure t)

(use-package doom-themes
  :init (load-theme 'doom-gruvbox t))

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-buffer-state-icon nil
        doom-modeline-buffer-modification-icon nil)
  :hook (after-init . doom-modeline-mode))

(setq doom-modeline-height 30)
(setq doom-modeline-bar-width 2)
(setq doom-modeline-buffer-file-name-style 'file-name)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-position-line-format '("%l"))
(setq doom-modeline-total-line-number t)
(setq doom-modeline-enable-word-count t)
(setq doom-modeline-project-name t)
(setq doom-modeline-lsp t)
(setq doom-modeline-time-icon nil)
(setq doom-modeline-modal t)
(setq doom-modeline-time nil)
(setq doom-modeline-buffer-encoding nil)
(setq doom-modeline-lsp t)

;; Completion

(electric-pair-mode 1)
(savehist-mode 1)

(use-package company
  :ensure t
  :config
  (setq company-require-match nil)
  (setq company-backends '((company-capf company-dabbrev company-files
					 company-keywords )))

  (global-company-mode 1)
  (setq company-idle-delay 0)
  (setq company-tooltip-animate t)
  (setq company-preview-if-just-one-frontend t)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t))


(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)))

;; Modes

(use-package nix-ts-mode
 :mode "\\.nix\\'")

;; LSP

(use-package eglot
  :hook
  (((python-mode nix-ts-mode) . eglot-ensure))

  :custom
  (eglot-send-changes-idle-time 0.1)
  (eglot-extend-to-xref t)

  :config
  (fset #'jsonrpc--log-event #'ignore))

(setq project-vc-extra-root-markers '(".git" ".project.el" ".projectile" ))

(use-package eldoc-box
  :ensure t
  ;;:init (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t)
  )

;; (use-package lsp-mode
;;   :ensure t
;;   :config
;;   (setq lsp-headerline-breadcrumb-enable nil
;;         lsp-enable-snippet nil
;;         lsp-rust-analyzer-server-display-inlay-hints t
;;         lsp-rust-analyzer-cargo-watch-command "clippy"
;;         lsp-rust-analyzer-completion-add-call-parenthesis t
;;         lsp-rust-analyzer-completion-add-call-argument-snippets t)
;;   :hook ((rust-mode . lsp)))

;;; Treemacs

(use-package treemacs
  :ensure t
  :defer nil
  :bind (("M-'" . treemacs))
  :config
  (setq treemacs-hide-gitignored-files-mode t)
  (setq treemacs-project-follow-cleanup t)
  (setq treemacs-width 45)
  (setq treemacs-width-is-initially-locked nil)
  (setq delete-by-moving-to-trash t)
  (setq treemacs-collapse-dirs 3)
  (setq treemacs-display-in-side-window t)
  (setq treemacs-is-never-other-window t)
  (setq treemacs-indentation 2)
  (setq treemacs-indentation-string " ")
  (setq treemacs-filewatch-mode t)
  (setq treemacs-git-mode 'deferred)
  (setq treemacs-text-scale 0.4)
  (setq treemacs-move-files-by-mouse-dragging nil)
  (setq treemacs-move-forward-on-expand t)
  (setq treemacs-pulse-on-success t)
  (setq treemacs-file-event-delay 0)
  (setq treemacs-deferred-git-apply-delay 0)
  (setq treemacs-git-commit-diff-mode 1))

(add-hook 'treemacs-mode-hook #'treemacs-project-follow-mode)

(use-package treemacs-nerd-icons
  :after nerd-icons
  :defer nil
  :config
  (treemacs-load-theme "nerd-icons"))
