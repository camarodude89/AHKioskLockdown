#Persistent

SetTitleMatchMode, 2

;Hides the taskbar completely
WinHide, ahk_class Shell_TrayWnd

;Disables dragging the Chrome window by the Title Bar
WinSet, Style, -0x40000, Chrome

;The below disables the keys that can be used for a Chrome kiosk

;Disables double clicking in Chrome
;specifically for the purpose of disabling minimizing the Chrome window by
;double clicking the title bar
#IfWinActive, Chrome

$*LButton::
ocmx := cmx
ocmy := cmy
MouseGetPos, cmx, cmy
If (ocmy != cmy) || (ocmx != cmx) || (A_TimeSincePriorHotkey > 500) || (A_TimeSincePriorHotkey > DllCall("GetDoubleClickTime"))
Click Down
return

$*LButton Up::Click Up

#IfWinActive

;Disables opening the start menu
~LWin Up::
~RWin Up::
^Esc::Return

;Blocks shortcut for opening new Chrome window
^n::Return

;Blocks shortcut for opening new incognito Chrome window
^+n::Return

;Blocks shortcut for opening a new tab
^t::Return

;Blocks opening a link in new background tab
^LButton::Return

;Blocks opening a link and jumping to it in another tab
^+LButton::Return

;Blocks opening a link in a new window
+LButton::Return

;Blocks downloading the target of a link
!LButton::Return

;Blocks shortcut for closing a tab
^w::
^F4::Return

;Blocks shortcut for opening download page
^j::Return

;Blocks shortcut for exiting Chrome
^+q::
^+w::Return

;Blocks opening browser history
^h::Return

;Blocks opening the last closed tab
^+t::Return

;Blocks bookmarking a webpage
^d::Return

;Blocks saving all open tabs as bookmarks in a new folder
^+d::Return

;Blocks toggling of full-screen mode
F11::Return

;Blocks toggling the bookmarks bar
^+b::Return

;Blocks setting focus on the first item in the Chrome toolbar
+!t::Return

;Blocks switching focus forward and back amongst the Address bar,
;Bookmarks bar and page
F6::
+F6::Return

;Blocks opening the Bookmark manager
^+o::Return

;Blocks saving a webpage
^s::Return

;Blocks clearing browsing data
^+Del::Return

;Blocks opening the Chrome task manager
;Couldn't get the task manager to open without being blocked but will
;leave this in for good measure
+Esc::Return

;Blocks opening the developer tools
^+i::
^+j::
F12::Return

;Blocks closing the window
!F4::Return

;Blocks opening Alt + Space context menu
!Space::Return

;Blocks opening the Chrome menu
!f::
!e::
F10::Return

;Blocks opening the Chrome Help Center in a new tab
F1::Return

;Blocks logging in as a different user or browsing as a Guest
^+m::Return

;Blocks opening a feedback form
!+i::Return

;Blocks opening a file in Chrome
^o::Return

;Blocks displaying non-editable HTML source code for the current page
^u::Return

;Reinitiates hotkey suspension
#p::
Suspend, Off
WinHide, ahk_class Shell_TrayWnd
WinSet, Style, -0x40000, Chrome
Return

;log out the user
;curly braces cannot be used here as it interferes with Suspend permit
;if they surround the entirety of the hotkey code block
^l::
Suspend, permit
If (A_IsSuspended) {
run, shutdown /l /f
}
Return


;Allows entry of Konami code to suspend blocking of hotkeys
#Space::
{
msgbox, Enter Konami Code!!!
~Up::
~Down::
~Left::
~Right::
~a::
~b::
~Enter::
CheckSequence( SubStr(A_ThisHotkey,2,1) )
Return
;-----------------------------------
CheckSequence(Char) {
static Sequence := "" , Wanted := "UUDDLRLRBAE"
Sequence := SubStr(  Sequence Char  ,  (StrLen(Wanted)-1)*(-1)  )
If ( Sequence = Wanted ) ; single '=' should be case insensitive
GoSub, myActionLabel ; you don't have to edit this function everytime
}
;-----------------------------------
myActionLabel:
Suspend, On
WinShow, ahk_class Shell_TrayWnd
WinSet, Style, +0x40000, Chrome
Return
}
