;This script locks down the keys that can be used for a Chrome kiosk

;Blocks shortcut for opening new Chrome window
^n::
Return

;Blocks shortcut for opening new incognito Chrome window
^+n::
Return

#p::Suspend
