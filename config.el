;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Pascal Dutilleul"
      user-mail-address "pascal@dutilsoft.be")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-acario-light)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;pascal 10/02/2021 autosave
(setq auto-save-default t
      make-backup-files t)

;;pascal 10/02/2021 disable exit confirmation
(setq confirm-kill-emacs nil)

;;pascal 10/02/2021 bigger screensize during startup
;;(setq initial-frame-alist '((top . 1) (left . 1) (width . 200) (height . 80)))
(setq initial-frame-alist '((width . 200) (height . 80)))


;; pascal 23/12/2020 bestandsnaam zonder path
;; (dit is eigenlijk de caption van de window)
;; (dus terug in commentaar gezet)
;;(setq frame-title-format "%b")
;;(setq icon-title-format "%b")
(setq frame-title-format
    '(""
      "%b"
      (:eval
       (let ((project-name (projectile-project-name)))
         (unless (string= "-" project-name)
           (format " in [%s]" project-name))))))


(setq-default header-line-format
              '("---[%b]---"))

;; titel van window (ter info : window is binnen een emacs frame )
;; als titel te lang is dan wordt die geprefixed door een blauwe elipsis
;; (defun with-face (str &rest face-plist)
;;     (propertize str 'face face-plist))
;;   (defun sl/make-header ()
;;     ""
;;     (let* ((sl/full-header (abbreviate-file-name buffer-file-name))
;;            (sl/header (file-name-directory sl/full-header))
;;            (sl/drop-str "[...]"))
;;       (if (> (length sl/full-header)
;;              (window-body-width))
;;           (if (> (length sl/header)
;;                  (window-body-width))
;;               (progn
;;                 (concat (with-face sl/drop-str
;;                                    :background "blue"
;;                                    :weight 'bold
;;                                    )
;;                         (with-face (substring sl/header
;;                                               (+ (- (length sl/header)
;;                                                     (window-body-width))
;;                                                  (length sl/drop-str))
;;                                               (length sl/header))
;;                                    ;; :background "red"
;;                                    :weight 'bold
;;                                    )))
;;             (concat (with-face sl/header
;;                                ;; :background "red"
;;                                :foreground "#8fb28f"
;;                                :weight 'bold
;;                                )))
;;         (concat (with-face sl/header
;;                            ;; :background "green"
;;                            ;; :foreground "black"
;;                            :weight 'bold
;;                            :foreground "#8fb28f"
;;                            )
;;                 (with-face (file-name-nondirectory buffer-file-name)
;;                            :weight 'bold
;;                            ;; :background "red"
;;                            )))))
;;   (defun sl/display-header ()
;;     (setq header-line-format
;;           '("" ;; invocation-name
;;             (:eval (if (buffer-file-name)
;;                        (sl/make-header)
;;                      "%b")))))
;;   (add-hook 'buffer-list-update-hook
;;             'sl/display-header)

;; Pascal 24/06/2021 org babel
;; https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-clojure.html
(require 'org)
(require 'ob-clojure)
(setq org-babel-clojure-backend 'cider)
(require 'cider)


;; Pascal 15/10/2021
(with-eval-after-load 'org
  ;; indent mode is dat de headings meer inspringen.
  ;; Kan je testen door te toggelen via M-x org-indent-mode
  (setq org-startup-indented t) ; enable org-indent-mode
                                ;
  )
