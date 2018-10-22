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

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; If you want try to write a hook that only allows the header line for programming contexts
;; And not for helm. Helm doesn't seem to have a hook so the way is to use prog-mode-hook.
;; (add-hook 'prog-mode-hook (lambda () (setq header-line-format nil))) ???
(setq-default header-line-format " ")

;; on macOS Sierra desktop-save-mode makes app bar black, no clue why. However below does the same.
;; This also makes helm gray highlight flush on the right side.
;; However it also makes line numbering off.
;; Why all of these side effects?
(desktop-save-mode 1) ;; This remembers where I last had emacs.

;; Setting title bar to transparent background. 
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)
(setq-default line-spacing 1) ;; default line spacing but can increase as you want.
(setq-default border-width 40)

;; If you ever want to add global numbering back:
;; (global-linum-mode 1)
;; (setq linum-format "%d ")
;; (add-hook 'eshell-mode-hook (lambda () (setq linum-format " ")))
(setq-default left-margin-width 1)

(load-theme 'nord t)

;; (tooltip-mode nil)
(electric-indent-mode 1)
(electric-pair-mode 1)

(setq-default mode-line-format
	      (list
	       "  %l:%c      "
	       mode-line-buffer-identification
	       '(vc-mode vc-mode)))

;; This will constantly hook up vcs and magit (though it may be quite CPU intensive)
;; (setq auto-revert-check-vc-info t)

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

(global-set-key (kbd "C-c e") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))


(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)

(global-set-key (kbd "s-g") 'goto-line)

(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "C-;") 'avy-goto-word-1)
(global-set-key (kbd "C-x C-p") 'avy-pop-mark)
;; (global-set-key (kbd "C-'") 'avy-goto-char)
;; (global-set-key (kbd "C-'") 'avy-goto-line)

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
(drag-stuff-define-keys) ;; Use left right top bottom arrows

(global-company-mode 1)
(setq company-idle-delay 0)
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

(eval-after-load 'helm
  (lambda () 
    (set-face-attribute 'helm-source-header nil
		    :weight 'normal
                    :width 'normal
                    :height 150)))

;; Hide Helm's extra informational mode lines
(fset 'helm-display-mode-line #'ignore)
(add-hook 'helm-after-initialize-hook
          (defun hide-mode-line-in-helm-buffer ()
            "Hide mode line in `helm-buffer'."
            (with-helm-buffer
              (setq-local mode-line-format nil))))

;; Temporary fix to hide ./ and ../ files from helm-find-files
;; Unfortunately this will leave you unable to navigate in empty directories.
(advice-add 'helm-ff-filter-candidate-one-by-one
        :around (lambda (fcn file)
                  (unless (string-match "\\(?:/\\|\\`\\)\\.\\{1,2\\}\\'" file)
                    (funcall fcn file))))

(setq eshell-prompt-function
  (lambda ()
    (concat (eshell/pwd) "\n"
      ">")))

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
    (rainbow-delimiters npm-mode yasnippet avy aggressive-indent dumb-jump drag-stuff anzu multiple-cursors powerline magit racket-mode sml-mode solidity-mode helm-ag haskell-mode helm-projectile projectile company ivy nord-theme))))

(custom-set-faces
 ;; (set-face-background 'header-line )
 '(header-line ((t (:height 100 :background "#2E3440"))))

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )