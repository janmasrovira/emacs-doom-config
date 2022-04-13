;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Jan Mas Rovira"
      user-mail-address "janmasrovira@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "SauceCodePro Nerd Font" :size 14.0 :weight 'semi-light))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(require 'agda-input nil t)

(setq doom-localleader-key ",")
(setq-default evil-escape-key-sequence "fd")

(map! :leader
      :desc "M-x"
      "SPC" #'execute-extended-command)

(map! :desc "Comment or uncomment lines"
      :leader "c l"
      #'evilnc-comment-or-uncomment-lines)

(map! :leader "1" #'winum-select-window-1)
(map! :leader "2" #'winum-select-window-2)
(map! :leader "3" #'winum-select-window-3)
(map! :leader "4" #'winum-select-window-4)
(map! :leader "5" #'winum-select-window-5)
(map! :leader "6" #'winum-select-window-6)
(map! :leader "7" #'winum-select-window-7)
(map! :leader "8" #'winum-select-window-8)
(map! :leader "9" #'winum-select-window-9)

(map! :leader "l l" #'+workspace/new)
(map! :leader "l k" #'+workspace/delete)
(map! :leader "l 1" #'+workspace/switch-to-0)
(map! :leader "l 2" #'+workspace/switch-to-1)
(map! :leader "l 3" #'+workspace/switch-to-2)
(map! :leader "l 4" #'+workspace/switch-to-3)
(map! :leader "l 5" #'+workspace/switch-to-4)
(map! :leader "l 6" #'+workspace/switch-to-5)
(map! :leader "l 7" #'+workspace/switch-to-6)
(map! :leader "l 8" #'+workspace/switch-to-7)
(map! :leader "l 9" #'+workspace/switch-to-8)

(map! :v "s" #'evil-surround-region)

(map! :leader "g s" #'magit-status)

(map! :localleader
      :map with-editor-mode-map
      "k"
      #'with-editor-cancel)
(map! :localleader
      :map with-editor-mode-map
      "c"
      #'with-editor-finish)

(map! :map vertico-map
      "C-h" #'vertico-directory-delete-char)
(map! :map vertico-map
      "C-l" #'vertico-directory-delete-word)

(map! :leader "j w"
      #'evil-avy-goto-word-or-subword-1)

(map! :leader "s a p"
      #'+default/search-project)

(map! :leader "q q"
      #'kill-emacs)

(+global-word-wrap-mode +1)

(setq display-line-numbers-type nil)

(push "~/projects/minijuvix/minijuvix-mode/" load-path)
(require 'minijuvix-mode)
