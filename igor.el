;; add commonly used paths
(push "~/.emacs.d/" load-path)
(push "~/.emacs.d/ecb-snap" load-path)
(push "~/.emacs.d/haskell-mode-2.8.0" load-path)

;; text selection
(cua-selection-mode t)

;; Mule cyrillic config
(set-language-environment 'UTF-8)
(setq default-input-method "cyrillic-translit")


;; C-tab switchs to a next window
(global-set-key [(control tab)] 'other-window)

;; smart scrolling
(setq scroll-step 1; плавный скроллинг
scroll-conservatively 100000; не прыгать на середину страницы при скроллинге
scroll-margin 5; начинать промотку страницы за 5 сток до края
scroll-preserve-screen-position t); без этого не будет нормально работать страница вниз/вверх
(global-hl-line-mode 1)



;; Haskell mode
(load "~/.emacs.d/haskell-mode-2.8.0/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(setq haskell-program-name "C:/HaskellPlatform/bin/ghci.exe")
(global-set-key (kbd "C-c h") 'haskell-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;; hsc3 lib
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'haskell-font-lock-symbols t)
(push "~/.emacs.d/hsc3-0.8/emacs" load-path)
(setq hsc3-help-directory "~/.emacs.d/hsc3-0.8/Help/")
;;(set 'haskell-font-lock-symbols t)
(put 'downcase-region 'disabled nil)
(require 'hsc3)

;;Erlang-mode
(add-to-list 'load-path "C:/Program Files/erl5.9/lib/tools-2.6.6.6/emacs")
(require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(setq erlang-root-dir "C:/Program Files/erl5.9")
(add-to-list 'exec-path "C:/Program Files/erl5.9/bin")
(setq erlang-man-root-dir "C:/Program Files/erl5.9/doc")
  
;; distel
(add-to-list 'load-path "~/.emacs.d/distel/elisp")
(require 'distel)
(distel-setup)

;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")

  (add-hook 'erlang-shell-mode-hook
                                        (lambda ()
                                                ;; add some Distel bindings to the Erlang shell
                                                (dolist (spec distel-shell-keys)
                                                        (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

;; color-theme
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)

(add-to-list 'load-path "~/.emacs.d/color-theme/themes")
(require 'color-theme-lazy)
(color-theme-lazy)

;; ECB 
;(require 'ecb)
;(global-set-key (kbd "\e\el") 'ecb-toggle-ecb-windows)
;(global-set-key (kbd "\e\eD") 'ecb-deactivate)
;(global-set-key (kbd "\e\eE") 'ecb-activate)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; desktop
(require 'desktop)
(desktop-save-mode 1)
(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))

;;
(defun win-resize-top-or-bot ()
  "Figure out if the current window is on top, bottom or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-y-min (nth 1 win-edges))
	 (this-window-y-max (nth 3 win-edges))
	 (fr-height (frame-height)))
	(cond
	 ((eq 0 this-window-y-min) "top")
	 ((eq (- fr-height 1) this-window-y-max) "bot")
	 (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-x-min (nth 0 win-edges))
	 (this-window-x-max (nth 2 win-edges))
	 (fr-width (frame-width)))
	(cond
	 ((eq 0 this-window-x-min) "left")
	 ((eq (+ fr-width 4) this-window-x-max) "right")
	 (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
   (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
   (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 1))))

(global-set-key [C-M-down] 'win-resize-minimize-vert)
(global-set-key [C-M-up] 'win-resize-enlarge-vert)
(global-set-key [C-M-left] 'win-resize-minimize-horiz)
(global-set-key [C-M-right] 'win-resize-enlarge-horiz)
(global-set-key [C-M-up] 'win-resize-enlarge-horiz)
(global-set-key [C-M-down] 'win-resize-minimize-horiz)
(global-set-key [C-M-left] 'win-resize-enlarge-vert)
(global-set-key [C-M-right] 'win-resize-minimize-vert)

;; Window restore
(load "~/.emacs.d/restore-window-on-startup.el")

;; scheme
(require 'quack)


;;(global-set-key [C-cC-t] 'comment-region)
(global-set-key (kbd "C-c t") 'comment-region)   ;; make C-c C-c and C-c C-u work
(global-set-key (kbd "C-c u") 'uncomment-region)


;; SICP
(require 'info)
(add-to-list 'Info-directory-list "~/.emacs.d/info")

(add-to-list 'load-path "~/.emacs.d/tumble")
(require 'tumble)

;; ---------------------   http://www.linuxrsp.ru/artic/dotemacs.html
;; Справедливости ради следует заметить, что существуют машины, у которых есть специальная кнопка 'Meta'. 
;; В таком случае ее нужно использовать вместо 'Esc'. Более того, некоторые перепрограммируют клавиатуру с кнопкой со значком 
;; Microsoft как кнопку 'Meta' и используют ее в том же самом ключе. Возможно, кто-нибудь найдет это тоже удобным. 
;; Мне привычнее жить с 'Esc'.
;; Например, чтобы найти строку с каким-либо номером, я использую комбинацию 'Esc Esc l', после чего ввожу номер 
;; строки и попадаю куда нужно в большом файле. Очень удобно при программировании. Для этого я добавил следующую строчку в .emacs: 

(global-set-key (kbd "\e\el") 'goto-line)

;; Другой пример из моего .emacs. Очень удобно запускать команду оболочки "make all", предварительно сохранив 
;; редактируемый буфер в файл. Для этого я добавил следующие строки в .emacs: 

;; general compile function call "make all"
(defun user-save-and-make-all ()
  "save and call shell command: make all"
  (interactive)
  (save-buffer)
  (shell-command "make all")
  (message "make all executed!"))
;;C-xs,M-x make all \n
(global-set-key (kbd "\e\em") 'user-save-and-make-all)



;;Toggle between saved positions as in MIM editor
(defun save-point-and-switch ()
  "Save current point to register 0 and go
to the previously saved position"
 (interactive)
 (let (temp)
   (setq temp (point-marker))
   (when (not (equal (get-register 0) nil))
     (jump-to-register 0))
   (set-register 0 temp)))
;;Save current position to register 0
(defun save-point-only ()
 "Save current point to register 0"
 (interactive)
 (set-register 0 (point-marker)))

(global-set-key (kbd "\e\e/") 'save-point-and-switch)
(global-set-key (kbd "\e\e?") 'save-point-only)

;; zen-coding
(add-to-list 'load-path "~/emacs.d/zencoding-mode")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
