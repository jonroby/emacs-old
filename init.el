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

;; This is only needed once, near the top of the file

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

(eval-when-compile
  (require 'use-package))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq make-backup-files nil)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(require 'indium)
;; (add-hook 'js-mode-hook #'indium-interaction-mode)
(global-set-key (kbd "C-c d j") 'indium-launch)
;; (add-hook 'indium-debugger-major-mode
;;   (lambda ()
;;     (define-key indium-debugger-mode-map (kbd "x") 'indium-quit)))


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
;; (setq linum-format " %d ")
;; (setq-default left-margin-width 1)
;; native line numbers

;; (setq-default 
              
;;               display-line-numbers-width 0 
;;               display-line-numbers-widen t)
;; (set-face-attribute 'line-number nil)
;; (set-face-attribute 'line-number-current-line nil
;;                     :foreground "#4C566A")

(load-theme 'nord t)

;; (tooltip-mode nil)
(electric-indent-mode 1)
(electric-pair-mode 1)

(setq-default mode-line-format
	      (list
	       "  %l:%c      "
	       mode-line-buffer-identification))
;; '(vc-mode vc-mode)

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

;; (global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "M-o") 'other-window)
;; rewrite so only use when 4 (5?) or greater windows.
;; (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; (use-package yassnippet :ensure t)

(global-set-key (kbd "C-c e") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

;; (use-package exec-path-from-shell
;;   :ensure t
;;   :if (memq window-system '(mac ns x))
;;   :config
;;   (setq exec-path-from-shell-variables '("PATH" "GOPATH"))
;;   (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "NVM_DIR")


(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)

(global-set-key (kbd "s-g") 'goto-line)

(global-set-key (kbd "C-;") 'avy-goto-word-1)
(global-set-key (kbd "C-'") 'avy-goto-char-in-line)
(global-set-key (kbd "C-]") 'avy-goto-line)
(global-set-key (kbd "C-x C-p") 'avy-pop-mark)
;; (global-set-key (kbd "C-'") 'avy-goto-char)
;; (global-set-key (kbd "C-'") 'avy-goto-line)


;; Use variable width font faces in current buffer
;;  "Set font to a variable width (proportional) fonts in current buffer"
;; (defun my-buffer-face-mode-variable ()
  ;; (interactive)
  ;; (setq buffer-face-mode-face '(
  ;; 		    :family "Source Code Pro"
  ;;                   :height 100
  ;;                   :weight 'normal
  ;;                   :width 'normal))
  ;; (buffer-face-mode))

;; (add-hook 'helm-major-mode-hook 'my-buffer-face-mode-variable)

;; (setq mac-command-modifier 'super)

(global-anzu-mode +1)

(drag-stuff-global-mode 1)
;; (drag-stuff-define-keys) ;; Use left right top bottom arrows
(global-set-key (kbd "M-p") 'drag-stuff-up)
(global-set-key (kbd "M-n") 'drag-stuff-down)

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


 (defun shortened-path (path max-len)
   "Return a modified version of `path', replacing some components
   with single characters starting from the left to try and get
   the path down to `max-len'"
   (let* ((components (split-string (abbreviate-file-name path) "/"))
	  (len (+ (1- (length components))
		  (reduce '+ components :key 'length)))
	  (str ""))
     (while (and (> len max-len)
		 (cdr components))
       (setq str (concat str (if (= 0 (length (car components)))
				 "/"
			       (string (elt (car components) 0) ?/)))
	     len (- len (1- (length (car components))))
	     components (cdr components)))
     (concat str (reduce (lambda (a b) (concat a "/" b)) components))))

 (defun rjs-eshell-prompt-function ()
   (concat (shortened-path (eshell/pwd) 40)
	   (if (= (user-uid) 0) " # " " $ ")))

(setq eshell-prompt-function
  'rjs-eshell-prompt-function)

;; (require 'eshell)
;; (require 'em-smart)

(setq helm-show-completion-display-function #'helm-show-completion-default-display-function)

(global-set-key (kbd "C-x h") 'helm-eshell-history)
;; (setq eshell-where-to-jump 'begin)
;; (setq eshell-review-quick-commands nil)
;; (setq eshell-smart-space-goes-to-end t)


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-agenda-files (list "~/.emacs.d/org/first.org"
                             "~/.emacs.d/org/life.org" 
                             "~/.emacs.d/org/writing.org"
			     "~/.emacs.d/org/fandor.org"
			     ))
(org-update-checkbox-count t)
(setq org-html-checkbox-type 'unicode)
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (push '("[ ]" .  "🞎") prettify-symbols-alist)
;;             (push '("[X]" . "🗷" ) prettify-symbols-alist)
;;             (push '("[-]" . "◫" ) prettify-symbols-alist)
;;             (prettify-symbols-mode)
;;             ))

(require 'multiple-cursors)
(global-set-key (kbd "s-n") 'mc/mark-next-like-this)
(global-set-key (kbd "s-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-a") 'mc/mark-all-like-this)

(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; https://www.emacswiki.org/emacs/IbufferMode
(setq ibuffer-saved-filter-groups
      (quote (("default"
	           ("shells" (or
                              (name . "noir sl")
			      (name . "fandorql sl")
			      (name . "matinee sl")
			      (name . "content_service sl")))
                   ("servers" (or
                              (name . "noir sv")
			      (name . "fandorql sv")
			      (name . "matinee sv")
			      (name . "content_service sv")))))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))
		   
(defun eshell/clear ()
  "clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; (defun eshell/clear ()
;;   "Clear the eshell buffer."
;;   (let ((inhibit-read-only t))
;;     (erase-buffer)
;;     (eshell-send-input)))


(defun eshell-dir (name dir cmd)
  (interactive)
  (eshell "new")
  (rename-buffer name)
  (cd dir)
  (when (not (equal cmd ""))
      (insert cmd)
      (eshell-send-input)))

(defun fandor-open ()
  (interactive)
  (eshell-dir "noir sl" "~/code/noir" "")
  (eshell-dir "fandorql sl" "~/code/fandorql" "")
  (eshell-dir "matinee sl" "~/code/matinee" "")
  (eshell-dir "content_service sl" "~/code/content_service" "")
  (eshell-dir "noir sv" "~/code/noir" "n 6.14.4 && npm start")
  (eshell-dir "fandorql sv" "~/code/fandorql" "n 8.12.0 && npm start")
  (eshell-dir "matinee sv" "~/code/matinee" "bundle install && rails s -p 3001")
  (eshell-dir "content_service sv" "~/code/content_service" "bundle install && rails s"))

(setq eshell-buffer-maximum-lines 1000)
(defun eos/truncate-eshell-buffers ()
  "Truncates all eshell buffers"
  (interactive)
  (save-current-buffer
    (dolist (buffer (buffer-list t))
      (set-buffer buffer)
      (when (eq major-mode 'eshell-mode)
        (eshell-truncate-buffer)))))
;; After being idle for 5 seconds, truncate all the eshell-buffers if
;; needed. If this needs to be canceled, you can run `(cancel-timer
;; eos/eshell-truncate-timer)'
(setq eos/eshell-truncate-timer
      (run-with-idle-timer 5 t #'eos/truncate-eshell-buffers))



(require 'engine-mode)
(engine-mode t)
(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")





;; LANGUAGE SPECIFIC

;; I believe this code allows flycheck to look at local node_modules rather than the global.
;; But notice that I use js2 mode in the first and flycheck in the second.
;; It may not be doing what I think. flycheck-verify with the executable found in local node_modules
;; was working and is what prompted this code change:
  ;; typescript-tslint
  ;;   - may enable:         yes
  ;;   - executable:         Found at /Users/JonRoby/Desktop/mod-cli/node_modules/.bin/tslint
  ;;   - configuration file: Found at "/Users/JonRoby/Desktop/mod-cli/tslint.json"
(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path))
(eval-after-load 'typescript-mode
  '(add-hook 'flycheck-mode-hook #'add-node-modules-path))




(yas-global-mode 1)

(setq js-indent-level 2)

;; For projects that use js for jsx try:
;; (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))



;; Tide
(require 'flycheck)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)







;; Adds comment styling for shebangs
(setq js2-skip-preprocessor-directives t)

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)




(setq-default left-fringe-width 16)

;; (setq-default right-fringe-width 10)

;; (set-face-attribute 'fringe nil :background "blue")

(define-fringe-bitmap 'flycheck-fringe-bitmap-ball
    (vector #b00000000
            #b11111110
            #b11111110
            #b11111110
            #b11111110
	    #b11111110
            #b11111110))

(flycheck-define-error-level 'error
  :severity 2
  :compilation-level 2
  :overlay-category 'flycheck-error-overlay
  :fringe-bitmap 'vertical-bar
  :fringe-face 'flycheck-fringe-error
  :error-list-face 'flycheck-error-list-error)
(flycheck-define-error-level 'info
  :severity 1
  :compilation-level 2
  :overlay-category 'flycheck-info-overlay
  :fringe-bitmap 'vertical-bar
  :fringe-face 'flycheck-fringe-info
  :info-list-face 'flycheck-info-list-error)

(flycheck-define-error-level 'warning
  :severity 0
  :compilation-level 2
  :overlay-category 'flycheck-warning-overlay
  :fringe-bitmap 'vertical-bar
  :fringe-face 'flycheck-fringe-warning
  :warning-list-face 'flycheck-warning-list-error)







(add-hook 'js2-mode-hook
          (lambda ()
            (define-key js2-mode-map (kbd "C-c f l") 'flycheck-list-errors)
            (define-key js2-mode-map (kbd "C-c f n") 'flycheck-next-error)
            (define-key js2-mode-map (kbd "C-c f p") 'flycheck-previous-error)
            (define-key js2-mode-map (kbd "C-c f f") 'flycheck-first-error)))

;; (add-hook 'js2-mode-hook 'prettier-js-mode)

;; (defun comint-clear-buffer ()
;;   (interactive)
;;   (let ((comint-buffer-maximum-size 0))
;;     (comint-truncate-buffer)))

;; let's bind the new command to a keycombo
;; (define-key comint-mode-map "C-c C-t" 'comint-clear-buffer)




(require 'nodejs-repl)

(defun nodejs-repl-send-region-and-clear (start end)
  "Send the current region to the `nodejs-repl-process'"
  (interactive "r")
  (let ((proc (nodejs-repl--get-or-create-process)))
    ;; Enclose the region in .editor ... EOF as this is more robust.
    ;; See: https://github.com/abicky/nodejs-repl.el/issues/17
    (comint-send-string proc ".editor\n")
    (comint-send-region proc start end)
    (comint-send-string proc "\n")
    (with-current-buffer (process-buffer proc)
      (comint-send-eof))))

(defun nodejs-repl-send-buffer-and-clear ()
  "Send the current buffer to the `nodejs-repl-process'"
  (interactive)
  (nodejs-repl-send-region-and-clear (point-min) (point-max)))

;; temp solution
(define-key nodejs-repl-mode-map (kbd "C-c C-t") (lambda () (interactive) (erase-buffer)))

(add-hook 'js2-mode-hook
  (lambda ()
    (define-key js-mode-map (kbd "C-c C-b") 'nodejs-repl-send-buffer)
    (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
    (define-key js-mode-map (kbd "C-c C-j") 'nodejs-repl-send-line)
    (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
    (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
    (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))






;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'js2-mode)

;; END LANGUAGE SPECIFIC





(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" default)))
 '(engine-mode t)
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (tide flycheck rjsx-mode prettier-js nodejs-repl js-comint yasnippet-snippets indium ace-window exec-path-from-shell restclient olivetti fountain-mode engine-mode browse-kill-ring org-bullets rainbow-delimiters npm-mode yasnippet avy aggressive-indent dumb-jump drag-stuff anzu multiple-cursors powerline magit racket-mode sml-mode solidity-mode helm-ag haskell-mode helm-projectile projectile company ivy nord-theme)))
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((t (:height 100 :background "#2E3440")))))
