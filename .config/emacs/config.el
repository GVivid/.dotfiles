;; This makes it so emacs knows where to look for files.
(use-package exec-path-from-shell
  :ensure t)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "MAGICK_HOME" "DYLD_LIBRARY_PATH"))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-initialize)
(setq custom-file "custom-vars.el")    ;; Specify the custom file path.
(load custom-file 'noerror 'nomessage) ;; Load the custom file quietly, ignoring errors.

(setq org-directory "~/Documents/Org")

(use-package org
  :ensure nil     ;; This is built-in, no need to fetch it.
  :defer t)       ;; Defer loading Org-mode until it's needed.

;;; Ensure org mode is loaded
(require 'org)

;; This tells emacs where to reference files for org-agenda.
(setq org-agenda-files (file-expand-wildcards (concat org-directory "/*.org")))

(global-set-key (kbd "C-S-o") 'org-agenda)

;;; Set the default file for general notes/captures
(setq org-default-notes-file (concat org-directory "/Ideas.org"))

(message (concat org-directory "/Inbox.org"))


;; Capture templates
;; I had an error here where I was concatenating the org-directory to
;; the file, but if you do not specify an absolute path, all
;; paths are relative to the org-directory path
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline "Inbox.org" "Inbox")
         "** TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

        ("f" "Fleeting" entry
         (file+headline "Ideas.org" "Fleeting")
         "** IDEA %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

        ("d" "Deadline" entry
         (file+headline "Calendar.org" "Deadlines")
         "** TODO %^{task}\ndeadline: %^{deadline}t\n:properties:\n:created: %u\n:captured: %a\n:end:\n%?")

        ("p" "Project" entry
         (file+headline "Projects.org" "Projects")
         "* PROJ %^{Project name}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n** TODO %?")

        ("i" "Idea" entry
         (file+headline "Ideas.org" "Ideas")
         "** IDEA %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?")

        ))

(global-set-key (kbd "C-S-c") 'org-capture)

;; This sets the files that refile can refile into. Maxlevel sets the number of subheadings refile can take.
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

(setq org-roam-capture-templates
        '(("d" "default" plain "%?" :target
           (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
           :unnarrowed t)
  
          ("l" "Literature" plain "%?"  :if-new
           (file+head "Literature/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
           :unnarrowed t)))
  

    ;; Modified from here: https://systemcrafters.net/build-a-second-brain-in-emacs/keep-a-journal/
    (use-package org-roam
      :ensure t
      :init
      (setq org-roam-v2-ack t)
      :custom
      (org-roam-directory (concat org-directory "/roam"))
      (org-roam-completion-everywhere t)
      (org-roam-dailies-capture-templates
        '(("d" "default" entry ""
           :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n:PROPERTIES:\n:CREATED: %U\n:END:\n"
                              ))))
:bind (("C-c n l" . org-roam-buffer-toggle)
       ("C-c n f" . org-roam-node-find)
       ("C-c n i" . org-roam-node-insert)
       :map org-mode-map
       ("C-M-i" . completion-at-point)
       :map org-roam-dailies-map
       ("Y" . org-roam-dailies-capture-yesterday)
       ("T" . org-roam-dailies-capture-tomorrow))
:bind-keymap
("C-c n d" . org-roam-dailies-map)
      :config
      (require 'org-roam-dailies) ;; Ensure the keymap is available
      (org-roam-db-autosync-mode))

(global-set-key (kbd "C-;") 'org-roam-dailies-goto-today)

;; This just sets where the images are stored for LaTeX.
(setq org-preview-latex-image-directory "~/Documents/ltximg/")
(add-to-list 'org-preview-latex-process-alist
             '(tectonic :programs ("tectonic" "convert")
                        :description "pdf > png"
                        :message "Ensure tectonic and imagemagick are installed."
                        :image-input-type "pdf"
                        :image-output-type "png"
                        :image-size-adjust (1.0 . 1.0)
                        :latex-compiler
                        ("tectonic -Z shell-escape-cwd=%o --outfmt pdf --outdir %o %F")
                        :image-converter
                        ("convert -density 192 -trim -background white -alpha remove %F %O")
                        :transparent-image-converter
                        ("convert -density 192 -trim -background none %F %O")))

(setq org-preview-latex-default-process 'tectonic)

;; This just maximizes the window.
(toggle-frame-maximized)

;; This makes it so text wraps globally.
(global-visual-line-mode)
