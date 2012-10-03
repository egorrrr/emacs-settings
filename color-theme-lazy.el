(eval-when-compile
  (require 'color-theme))

(defun color-theme-lazy ()
  "Lazy theme."
  (interactive)
  (color-theme-install
   '(color-theme-lazy
     ((foreground-color . "SystemWindowText")
      (background-color . "SystemWindow")
      (background-mode . dark))
     (default ((t (:inherit nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Courier New"))))
     (font-lock-comment-face ((((class color) (min-colors 88) (background light)) (:foreground "gray60"))))
     (font-lock-doc-face ((t (:foreground "RoyalBlue"))))
     (font-lock-function-name-face ((((class color) (min-colors 88) (background light)) (:foreground "RoyalBlue"))))
     (font-lock-keyword-face ((((class color) (min-colors 88) (background light)) (:foreground "DarkOrange"))))
     (font-lock-string-face ((((class color) (min-colors 88) (background light)) (:foreground "chartreuse4"))))
     (font-lock-type-face ((((class color) (min-colors 88) (background light)) (:foreground "RoyalBlue"))))
     (font-lock-variable-name-face ((((class color) (min-colors 88) (background light)) (:foreground "chocolate"))))
     (font-lock-warning-face ((((class color) (min-colors 88) (background light)) (:foreground "IndianRed" :weight bold))))
     (highlight ((((class color) (min-colors 88) (background light)) (:background "lemon chiffon"))))
     (isearch ((((class color) (min-colors 88) (background light)) (:background "DarkOrange1" :foreground "black"))))
     (lazy-highlight ((((class color) (min-colors 88) (background light)) (:background "plum2"))))
     (link ((((class color) (min-colors 88) (background light)) (:foreground "SlateBlue" :underline t))))
     (mode-line ((((class color) (min-colors 88)) (:background "grey90" :foreground "grey20" :box (:line-width -1 :color "Royal Blue")))))
     (mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width -1 :color "Royal Blue")))))
     (mode-line-inactive ((t (:box (:line-width -1 :color "Indian Red")))))
     (show-paren-match ((((class color) (background light)) (:background "#bfe8df"))))
     (trailing-whitespace ((((class color) (background light)) (:background "IndianRed")))))))
(add-to-list 'color-themes '(color-theme-lazy
                             "Lazy"
                             ""))

(provide 'color-theme-lazy)