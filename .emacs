(add-to-list 'load-path "~/.emacs.d")

(require 'install-elisp)

;; Ctrl-h
(global-set-key "\C-h" 'backward-delete-char)

;; for-yaml
 (require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
 '(lambda ()
   (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; byble 35p
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; byble 49p
(require 'auto-install)

(add-to-list 'load-path auto-install-directory)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; byble 143
(require 'auto-complete-config)
(global-auto-complete-mode 1)

;; 列番号も表示
(column-number-mode t)

;; expand region
(add-to-list 'load-path "~/.emacs.d/expand-region.el")

(add-to-list 'load-path "~/.emacs.d/mark-multiple.el")
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)

;; (install-elisp "https://raw.github.com/k1LoW/emacs-sense-expand-region/master/sense-expand-region.el")
(require 'sense-expand-region)
(global-set-key (kbd "C-@") 'sense-expand-region)

;; 全角スペース 改行 タブ表示
;; (install-elisp "http://homepage3.nifty.com/satomii/software/jaspace.el")
(require 'jaspace)
(setq jaspace-alternate-jaspace-string "□")
;(setq jaspace-alternate-eol-string "↓\n")
(setq jaspace-highlight-tabs ?^ )

; http://blog.lathi.net/articles/2007/11/07/sharing-the-mac-clipboard-with-emacs
(defun copy-from-osx ()
 (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
 (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
       (process-send-string proc text)
       (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; for org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-agenda-files (list org-directory))
(add-hook 'org-mode-hook
  (lambda()
    (require 'imenu-tree)))
(global-set-key (kbd "M-h") 'imenu-tree)


(server-start) ;  sudoeditで使う
(require 'sudo-ext)
