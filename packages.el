;;; packages.el --- dbt layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2024 Sylvain Benner & Contributors
;;
;; Author: Data Mike <mjp35@cornell.edu>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `dbt-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `dbt/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `dbt/pre-init-PACKAGE' and/or
;;   `dbt/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst dbt-packages
  '(polymode
    (dbt-mode
     :location (recipe
                :fetcher github
                :repo "CyberShadow/dbt-mode")))
  "The list of Lisp packages required by the dbt layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun dbt/init-dbt-mode ()
  (use-package dbt-mode
    :defer t
    :after (sql jinja2-mode polymode))
  (add-to-list 'magic-mode-alist '(dbt/sql-file-p . dbt-mode)))

(defun dbt/init-polymode ()
  (use-package polymode
    :defer t))

(defun dbt/sql-file-p ()
  "Returns non-nil if current buffer is a sql file in a dbt project."
  (interactive)
  (and
   (string-suffix-p ".sql" (downcase (buffer-file-name)))
   (locate-dominating-file (file-name-directory (buffer-file-name))
                           "dbt_project.yml")))
