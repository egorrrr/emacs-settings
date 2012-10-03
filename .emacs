(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(cursor-in-non-selected-windows nil)
 '(dta-default-cfg "default.conf")
 '(ecb-compile-window-height 10)
 '(ecb-compile-window-temporally-enlarge (quote after-selection))
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-layout-name "left1")
 '(ecb-options-version "2.40")
 '(ecb-prescan-directories-for-emptyness nil)
 '(ecb-tip-of-the-day nil)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-width 2))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.  #bfe8df
 '(show-paren-match ((((class color) (background light)) (:background "#bfe8df")))))

(load-file "~/.emacs.d/emacs-starter-kit/init.el")
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
