;;; himalaya-menu.el --- Menus for Himalaya  -*- lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: Jesse Claven
;; Maintainer: Jesse Claven
;; Version: 0.0.1
;; Package-Requires: ((emacs "27.1") (transient "0.3.0") (himalaya "1.0"))
;; URL: https://github.com/jesse-c/himalaya-menu-emacs
;; Keywords: mail comm

;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;; Transient menus for the Himalaya email client interface.
;; This package provides transient command menus for Himalaya modes.

;;; Code:

(require 'transient)
(require 'himalaya-envelope)
(require 'himalaya-message)

;;;###autoload
(transient-define-prefix himalaya-list-envelopes-transient-menu ()
  "Himalaya envelopes command menu."
  ["Navigation"
   [("j" "Next line" next-line)
    ("k" "Previous line" previous-line)]
   [("J" "Go to page" himalaya-list-envelopes-at-page)
    ("f" "Next page" himalaya-list-envelopes-next-page)
    ("b" "Previous page" himalaya-list-envelopes-prev-page)]
   [("n" "Refresh page" himalaya-list-envelopes)]]

  ["Actions"
   [("RET" "Read message" himalaya-read-message-at-point)
    ("w" "Write new message" himalaya-write-new-message)
    ("r" "Reply to message" himalaya-reply-to-message-at-point)]
   [("R" "Reply all" himalaya-reply-to-message-at-point)
    ("F" "Forward message" himalaya-forward-message-at-point)]]

  ["Marking"
   [("m" "Mark forward" himalaya-mark-envelope-forward)
    ("u" "Unmark forward" himalaya-unmark-envelope-forward)]
   [("DEL" "Unmark backward" himalaya-unmark-envelope-backward)
    ("U" "Unmark all" himalaya-unmark-all-envelopes)]]

  ["Operations"
   [("D" "Delete marked" himalaya-delete-marked-messages)
    ("C" "Copy marked" himalaya-copy-marked-messages)]
   [("M" "Move marked" himalaya-move-marked-messages)
    ("a" "Download attachments" himalaya-download-marked-attachments)]
   [("s" "Mark unread" himalaya-mark-unread-envelope)
    ("e" "Expunge folder" himalaya-expunge-folder)
    ("q" "Quit" kill-current-buffer)]])

;;;###autoload
(transient-define-prefix himalaya-read-message-transient-menu ()
  "Himalaya message reading command menu."
  ["Navigation"
   [("n" "Next message" himalaya-next-message)
    ("p" "Previous message" himalaya-prev-message)]]

  ["Actions"
   [("r" "Reply" himalaya-reply-to-current-message)
    ("f" "Forward" himalaya-forward-current-message)]
   [("R" "View raw" himalaya-read-current-message-raw)
    ("H" "View HTML" himalaya-read-current-message-html)
    ("a" "Download attachments" himalaya-download-current-attachments)]
   [("M" "Move to folder" himalaya-move-current-message)
    ("D" "Delete message" himalaya-delete-current-message)
    ("s" "Mark unread" himalaya-mark-unread-current-message)
    ("q" "Quit" kill-current-buffer)]])

;;;###autoload
(transient-define-prefix himalaya-read-message-raw-transient-menu ()
  "Himalaya raw message command menu."
  ["Navigation"
   [("n" "Next message" himalaya-next-message)
    ("p" "Previous message" himalaya-prev-message)]]

  ["Actions"
   [("r" "Reply" himalaya-reply-to-current-message)
    ("f" "Forward" himalaya-forward-current-message)]
   [("R" "View formatted" himalaya-read-current-message-plain)
    ("H" "View HTML" himalaya-read-current-message-html)
    ("a" "Download attachments" himalaya-download-current-attachments)]
   [("M" "Move to folder" himalaya-move-current-message)
    ("D" "Delete message" himalaya-delete-current-message)
    ("s" "Mark unread" himalaya-mark-unread-current-message)
    ("q" "Quit" kill-current-buffer)]])

;;;###autoload
(defun himalaya-menu-setup ()
  "Set up transient menus for Himalaya modes."
  (define-key himalaya-list-envelopes-mode-map (kbd "?") #'himalaya-list-envelopes-transient-menu)
  (define-key himalaya-read-message-mode-map (kbd "?") #'himalaya-read-message-transient-menu)
  (define-key himalaya-read-message-raw-mode-map (kbd "?") #'himalaya-read-message-raw-transient-menu))

(provide 'himalaya-menu)
;;; himalaya-menu.el ends here
