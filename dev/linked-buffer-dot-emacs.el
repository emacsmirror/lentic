(setq debug-on-error t)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(unless (file-exists-p package-user-dir)
  (package-refresh-contents))

(package-initialize)

(defun ensure-elpa (package)
  (when
      (not (package-installed-p package))
    (package-install package)))

(ensure-elpa 'dash)
;; this is a pain because it causes elpa loading of m-buffer
;; locally
(ensure-elpa 'm-buffer)
(ensure-elpa 'f)