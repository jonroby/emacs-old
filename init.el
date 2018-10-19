;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; reload this file with load-file (so as not to restart emacs every time)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(global-set-key (kbd "C-c e") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(global-display-line-numbers-mode)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(load-theme 'nord t)
(require 'powerline)
(powerline-default-theme)
(setq powerline-image-apple-rgb t)
;; (setq ns-use-srgb-colorspace nil)

;; Set default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 150
                    :weight 'normal
                    :width 'normal)

(set-face-bold-p 'bold nil)

(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)


;; (global-set-key (kbd "s-t") 'helm-projectile-find-file)
;; (global-set-key (kbd "M-g j") 'dumb-jump-go)
;; (global-set-key (kbd "M-g b") 'dumb-jump-back)
;; (global-set-key (kbd "M-g q") 'dumb-jump-quick-look)
;; (global-set-key (kbd "<f1>") 'goto-line)

;; (projectile-mode +1)

;; (global-set-key (kbd "C-x p") 'projectile-command-map)



;; Use variable width font faces in current buffer
(defun my-buffer-face-mode-variable ()
  "Set font to a variable width (proportional) fonts in current buffer"
  (interactive)
  (setq buffer-face-mode-face '(
		    :family "Source Code Pro"
                    :height 100
                    :weight 'normal
                    :width 'normal))
  (buffer-face-mode))

(add-hook 'helm-major-mode-hook 'my-buffer-face-mode-variable)

;; (setq mac-command-modifier 'super)
(global-set-key (kbd "s-t") 'helm-ag-project-root)

;; (ivy-mode 1)
;; (setq ivy-height 20)
;; (setq ivy-use-virtual-buffers t)
;; (setq ivy-count-format "(%d/%d) ")
;; (global-set-key (kbd "C-s") 'swiper)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)

;; (global-set-key (kbd "C-l") 'backward-kill-word)


(global-set-key (kbd "C-x C-x") (kbd "C-x C-x"))

;; (load-file (let ((coding-system-for-read 'utf-8))
;;                 (shell-command-to-string "agda-mode locate")))

(setq make-backup-files nil)

(setq js-indent-level 2)
(setq electric-pair-preserve-balance nil)
(setq tab-always-indent 'complete)

(require 'multiple-cursors)
(global-set-key (kbd "s-n") 'mc/mark-next-like-this)
(global-set-key (kbd "s-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-a") 'mc/mark-all-like-this)

(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          )))

(add-hook 'racket-mode-hook 'my-pretty-lambda)
(global-prettify-symbols-mode 1)

;; This shows number of matches when C-s for a word
(global-anzu-mode +1)

(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-t") 'company-search-toggle-filtering))

(dumb-jump-mode)
(setq dumb-jump-selector 'helm)
(global-set-key (kbd "M-g g") 'dumb-jump-go)
(global-set-key (kbd "M-g b") 'dumb-jump-back)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x m") 'magit-dispatch-popup)

;; Not entirely sure how this works, but when executing
;; projectile-add-known-project it only uses the root
;; of the file when displaying projects (C-x p)

;; ("~/Desktop/JonRoby/grok/")
(require 'projectile)
(projectile-global-mode) ;; This caches the files!
(setq projectile-enable-caching t)
(global-set-key (kbd "C-x a") 'projectile-add-known-project)

(require 'helm)
(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x p") 'helm-projectile-switch-project)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" default)))
 '(package-selected-packages
   (quote
    (dumb-jump drag-stuff anzu multiple-cursors powerline magit racket-mode sml-mode solidity-mode helm-ag haskell-mode helm-projectile projectile company ivy nord-theme))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
