;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; reload this file with load-file (so as not to restart emacs every time)

;; M-m goes to beginning of indentation!
;; C-M-v will scroll other window!!!
;; C-M-f / C-M-b movement by balanced expression.

;; Bookmarks
;; C-x r m - to save bookmark
;; C-x r b - to jump to bookmark
;; C-x r l - to list all bookmarks


(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(desktop-save-mode 1) ;; on macOS Sierra this makes app bar black!!!

(setq-default line-spacing 1)

(global-set-key (kbd "C-c e") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(global-display-line-numbers-mode)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(load-theme 'nord t)
;; (require 'powerline)
;; (powerline-default-theme)
;; (setq powerline-image-apple-rgb t)
;; (setq ns-use-srgb-colorspace nil)

(setq-default mode-line-format
	      (list
	       " %l:%c      "
	       mode-line-buffer-identification
	       '(vc-mode vc-mode)))

;; Set default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 150
                    :weight 'normal
                    :width 'normal)

(set-face-bold-p 'bold nil)

;; (defun xah-beginning-of-line-or-block ()
;;   (interactive)
;;   (let (($p (point)))
;;     (if (or (equal (point) (line-beginning-position))
;;             (equal last-command this-command ))
;;         (if (re-search-backward "\n[\t\n ]*\n+" nil "NOERROR")
;;             (progn
;;               (skip-chars-backward "\n\t ")
;;               (forward-char ))
;;           (goto-char (point-min)))
;;       (progn
;;         (back-to-indentation)
;;         (when (eq $p (point))
;;           (beginning-of-line))))))

;; (defun xah-end-of-line-or-block ()
;;   (interactive)
;;   (if (or (equal (point) (line-end-position))
;;           (equal last-command this-command ))
;;       (progn
;;         (re-search-forward "\n[\t\n ]*\n+" nil "NOERROR" ))
;;     (end-of-line)))

;; (global-set-key (kbd "C-a") 'xah-beginning-of-line-or-block)
;; (global-set-key (kbd "C-e") 'xah-end-of-line-or-block)

(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)

(global-set-key (kbd "s-g") 'goto-line)

(global-set-key (kbd "M-n")
  (lambda ()
    (interactive)
    (setq this-command 'next-line)
    (next-line 4)))

;; replaces backward-sentence
(global-set-key (kbd "M-p")
  (lambda ()
    (interactive)
    (setq this-command 'previous-line)
    (previous-line 4)))


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
(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action) ;; stops tab from going to dired
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x p") 'helm-projectile-switch-project)
(global-set-key (kbd "C-x f") 'helm-projectile-find-file)
(global-set-key (kbd "C-x n") 'helm-projectile-ag)


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
