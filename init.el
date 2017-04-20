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

(use-package anything
  :ensure t)

(use-package auto-complete
  :ensure t
  :init
  (ac-config-default))

(use-package cedet
  :ensure t)

(use-package cider
  :ensure t
  :init
  ;; Enter cider mode when entering the clojure major mode
  (add-hook 'clojure-mode-hook 'cider-mode))

(use-package company
  :ensure t
  :init
  ;; Turn on auto-completion with Company-Mode
  (global-company-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent))))


(use-package cuda-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode)))

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

  (use-package rainbow-delimiters
    :ensure t
    :init
    (rainbow-delimiters-mode t))

  (use-package rsense
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

  (use-package yasnippet
    :ensure t)
                                        ; ----- end package dependencies


										; ----- TODO

;; install and learn to use helm-ag
;; ditto: pymacs/ropemacs
;; ditto: ropemacs


;; have to do this to get proper highlighting and enable rainbow-delimiters 