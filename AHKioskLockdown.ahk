;This script locks down the keys that can be used for a Chrome kiosk

;Blocks shortcut for opening new Chrome window
^n::
Return

;Blocks shortcut for opening new incognito Chrome window
^+n::
Return

;Blocks shortcut for opening a new tab
^t::
Return

;Blocks shortcut for opening download page
^j::
Return

;Blocks shorcut for exiting Chrome
^+q::
Return

;Blocks opening browser history
^h::
Return

;Blocks opening the last closed tab
^+t::
Return


;Blocks bookmarking a webpage
^d::
Return

;Blocks bookmarking open pages...
^+d::
Return

;Blocks toggling the bookmarks bar
^+b::
Return

;Blocks opening the Bookmark manager
^+o::
Return

;Blocks saving a webpage
^s::
Return

;Blocks clearing browsing data
^+Del::
Return

;Blocks opening the Chrome task manager
;Couldn't get the task manager to open without being blocked but will
;leave this in for good measure
+Esc::
Return

;Blocks opening the developer tools
^+i::
Return

;Blocks close the window
!F4::
Return

#p::Suspend
