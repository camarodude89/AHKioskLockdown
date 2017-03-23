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
shortcut Win+Space. This will display as message box stating, "Enter Konami
Code!!!" At this point enter the key combination: Up, Up, Down, Down, Left,
Right, Left, Right, B, A, Enter (aka Konami code.) This will suspend all
hotkeys, thereby disabling the blocking of keyboard shortcuts.

### Logging the user off

Once the Konami code has been entered, the keyboard shortcut for logging the
user off becomes available. To log off, simply use the shortcut Ctrl+L. This
runs the command line statement: shutdown /l /f.
