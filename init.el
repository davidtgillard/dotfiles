;; custom color theme. For emacs versions 24 and higher, must use load-theme
(load-theme `tsdh-dark t)

;; set delete key to do the right thing on a mac. (Note that this isn't required for aquamacs)
(global-set-key [kp-delete] 'delete-char)

;; ensure indent with tabs
(setq indent-tabs-mode t)

;; set default tab width
(setq-default tab-width 4)

;; disable systems beeping
(setq visible-bell t)

;; set c default style to linux
(setq c-default-style "bsd"
      c-basic-offset 2)

;; iwb idents the whole buffer
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; Reload init.el file by typing: M-x reload.
(defun reload () "Reloads ~/.emacs.d/init.el interactively."
       (interactive)
       (load "~/.emacs.d/init.el"))

;; backwards-kill-word
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; enable line wrap, even with multiple windows open
(setq truncate-partial-width-windows nil)

;; highlight brackets
(require 'paren)
(show-paren-mode 1)

;; cua mode for cutting and pasting using c-x, c-v like everything else
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; enable cutting and pasting from other programs
(setq x-select-enable-clipboard t)

;; bind C-tab to completion instead of M-tab, which switches apps in Ubuntu
(define-key function-key-map [(control tab)] [?\M-\t])


                                        ; ----- package dependencies

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (require 'package)
  (setq package-enable-at-startup nil))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-refresh-contents)
(package-install 'use-package)


(use-package gnu-elpa-keyring-update
  :ensure t)

(use-package anything
  :ensure t)

(use-package auto-complete
  :ensure t
  :init
  (ac-config-default))

;(use-package cedet
;  :ensure t)

;(use-package cider
;  :ensure t
;  :init
  ;; Enter cider mode when entering the clojure major mode
;  (add-hook 'clojure-mode-hook 'cider-mode))

;(use-package clj-refactor
;  :ensure t
;  :init
;  (add-hook 'clojure-mode-hook (lambda ()
;                                 (clj-refactor-mode 1))))

;(use-package company
;  :ensure t
;  :init
  ;; Turn on auto-completion with Company-Mode
;  (global-company-mode)
;  (add-hook 'cider-repl-mode-hook #'company-mode)
;  (add-hook 'cider-mode-hook #'company-mode)
;  (add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent))))

;(use-package cuda-mode
;  :ensure t
;  :init
;  (add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode)))

(use-package ecb
  :ensure t)

(use-package highlight-symbol
  :ensure t
  :init
  ;; Syntax Highlighting
  (global-set-key (kbd "C-'") 'highlight-symbol-at-point)
  (global-set-key (kbd "C-,") 'highlight-symbol-next)
  (global-set-key (kbd "C-.") 'highlight-symbol-prev)
  (global-set-key (kbd "C-;") 'highlight-symbol-query-replace))

(use-package ido
  :ensure t
  :init
  (ido-mode t))

(use-package linum
  :ensure t
  :init
  (setq linum-format "%d ")
  (global-linum-mode t))

(use-package protobuf-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode)))

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rsense
  :ensure t)

(use-package s
  :ensure t)

(use-package smart-tabs-mode
  :ensure t
  :init
  (autoload 'smart-tabs-mode "smart-tabs-mode"
    "Intelligently indent with tabs, align with spaces!")
  (autoload 'smart-tabs-mode-enable "smart-tabs-mode")
  (autoload 'smart-tabs-advice "smart-tabs-mode")
  (autoload 'smart-tabs-insinuate "smart-tabs-mode")
  (smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'nxml 'python 'ruby)
  (add-hook 'tcl-mode-hook 'smart-tabs-mode-enable)
  (smart-tabs-advice tcl-indent-line tcl-indent-level))

;; Ensure tramp package is present
(use-package tramp
  :ensure t)

(use-package web-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package yasnippet
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

                                        ; ----- end package dependencies


                                        ; ----- TODO

;; install and learn to use helm-ag
;; ditto: pymacs/ropemacs
;; ditto: ropemacs


;; have to do this to get proper highlighting and enable rainbow-delimiters
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(font-use-system-font t)
 '(package-selected-packages
   (quote
	(csharp-mode s s-buffer yaml-mode web-mode use-package smart-tabs-mode rsense rainbow-delimiters protobuf-mode highlight-symbol gnu-elpa-keyring-update ecb cuda-mode company clj-refactor auto-complete anything)))
 '(show-paren-mode t)
 '(transient-mark-mode (quote (only . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 105 :width normal)))))
(put 'upcase-region 'disabled nil)
