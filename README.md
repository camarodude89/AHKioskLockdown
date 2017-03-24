# AHKioskLockdown

## Purpose

This AutoHotKey script is meant for use on kiosks utilizing Google Chrome
as their primary program. It prevents users from using keyboard shortcuts
that could lead to security risks or access to areas of Chrome that are not
desired.

The keyboard shortcuts are blocked by intercepting them with hotkeys
immediately proceeded by Return statements. The hotkeys are used globally as
some of the keyboard shortcuts are system based rather than Chrome only and
they will not interfere with use of the kiosk as Chrome is the only program
in use.


## Script Usage

The script only need be executed and it will do the rest.

### Disable blocking

If you need to disable the keyboard shortcut blocking, use the keyboard
shortcut Win + Space. This will display as message box stating, "Enter Konami
Code!!!" At this point enter the key combination: Up, Up, Down, Down, Left,
Right, Left, Right, B, A, Enter (aka Konami code.) This will suspend all
hotkeys, thereby disabling the blocking of keyboard shortcuts. Blocking of
shortcuts can be restored by using the shortcut Win + P.

### Logging the user off

Once the Konami code has been entered, the keyboard shortcut for logging the
user off becomes available. To log off, simply use the shortcut Ctrl + L. This
runs the command line statement: shutdown /l /f.

## Blocked Keyboard Shortcuts

This Chrome shortcut page was used as reference: [Chrome keyboard shortcuts](https://support.google.com/chrome/answer/157179?hl=en)

Currently blocked shortcuts (no particular order):

Key Combo | Description
--- | ---
Ctrl + N | Open new Chrome window
Ctrl + Shift + N | Open new incognito Chrome window
Ctrl + T | Open a new table
Ctrl + Left Click | Open a link in a new background tab
Ctrl + Shift + Left Click | Open a link and jump to it in a new tab
Shift + Left Click | Open a link in a new window
Alt + Left Click | Download the target of a link
Ctrl + W & Ctrl + F4 | Close the current tab
Ctrl + J | Open the download page
Ctrl + Shift + Q & Ctrl + Shift + W | Exit Chrome
Ctrl + H | Open browser history
Ctrl + Shift + T | Open the last closed tab
Ctrl + D | Bookmark the current webpage
Ctrl + Shift + D | Save all open tabs as bookmarks in a new folder
F11 | Toggle full-screen mode
Ctrl + Shift + B | Toggle visibility of the bookmarks bar
Shift + Alt + T | Set focus on the first item in the Chrome toolbar
F6 & Shift + F6 | Switch focus forward and back amongst the Address bar, Bookmarks bar and webpage
Ctrl + Shift + O | Open the Bookmark Manager
Ctrl + S | Save current webpage
Ctrl + Shift + Del | Clear browsing data
Shift + Esc | Open the Chrome task manager
Ctrl + Shift + I & Ctrl + Shift + J & F12 | Open the developer tools
Alt + F4 | Close the window
Alt + Space | Blocks the Alt + Space context menu
Alt + F & Alt + E & F10 | Open the Chrome menu
F1 | Open the Chrome Help Center in a new tab
Ctrl + Shift + M | Log in as a different user or browse as a Guest
Alt + Shift + I | Open a feedback form
Ctrl + O | Open a file in Chrome
Ctrl + U | Display non-editable HTML source code for the current page
