;;; layers.el --- dbt layer dependencies file for Spacemacs.
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

;; Dependencies:
;; - dbt-mode depends on sql-mode
;;   - dbt layer depends on sql layer
;; - dbt-mode depends on jinja2-mode
;;   - dbt layer depends on ansible layer
;; - dbt-mode depends on polymode
;;   - Not in spacemacs yet; see dbt layer packages.el
(configuration-layer/declare-layer-dependencies '(sql
                                                  ansible))
