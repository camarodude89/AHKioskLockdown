#Persistent
#SingleInstance, Force

SetTitleMatchMode, 2

CreatePrinterButton() {
    WinGetPos, x, y, w, h, Google Chrome
    WinGet, isMax, MinMax, Google Chrome
    
    ;calculate the location of the top left corner of print button
    topLeftX := (x + w) - 34
    topLeftY := y + 45

    if (isMax = 1) {
        topLeftX -= 10
        topLeftY += 2
    }

    Gui, Color, FFFFFF ;Random RGB color, doesn't matter what it is
    Gui, Margin, 0, 0
    Gui, Add, Picture, gPrint x0 y0, printerIcon.png
    Gui, +LastFound +AlwaysOnTop -Border -SysMenu -Caption +ToolWindow
    WinSet, TransColor, FFFFFF
    Gui, Show, x%topLeftX% y%topLeftY%, Printer Button

    bottomRightX := topLeftX + 32
    bottomRightY := topLeftY + 32

    dataDict := {"Top Left X":topLeftX, "Top Left Y":topLeftY, "Bottom Right X":bottomRightX, "Bottom Right Y":bottomRightY}
    Return dataDict
}

Print() {
    Print:
    ; Gets the control ID of google chrome
    ControlGet, controlID, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome
    ; Focuses on chrome without breaking focus on what you're doing
    ControlFocus,,ahk_id %controlID%
    ControlSend, ahk_parent, ^p, Google Chrome
    controlID := 0
    Return
}

CreateWindow() {
    WinGetPos, x, y, w, h, Google Chrome
    WinGet, isMax, MinMax, Google Chrome

    xCoordOfWin := (x + w) - 320
    yCoordOfWin := y

    width := 320
    height := 100

    if (isMax = 1) {
        x += 8
        y += 8
        height += 2
    }
    else {
        height += 4
    }

    Gui, Color, 46bfec
    Gui, Margin, %width%, %height%
    Gui, +LastFound +E0x80000 +AlwaysOnTop -Border -SysMenu +Owner -Caption
    Gui, Show, x%xCoordOfWin% y%yCoordOfWin%, overlay
    WinSet, Transparent, 150, overlay
    Return
}

CalculateOffLimitsZone() {
    WinGetPos, x, y, w, h, Google Chrome
    WinGet, isMax, MinMax, Google Chrome

    topLeftX := (x + w) - 320
    topLeftY := y
    width := 320
    height := 100

    if (isMax = 1) {
        topLeftX += 8
        topLeftY += 8
        height += 2
    }
    else {
        height += 4
    }

    bottomRightX := topLeftX + width
    bottomRightY := topLeftY + height

    dataDict := {"Top Left X":topLeftX, "Top Left Y":topLeftY, "Bottom Right X":bottomRightX, "Bottom Right Y":bottomRightY}
    Return dataDict
}

;Hides the taskbar completely
WinHide, ahk_class Shell_TrayWnd

;Creates initial printer button
WinWaitActive, Google Chrome
Sleep 500
pBtnDataDict := CreatePrinterButton()
offDataDict := CalculateOffLimitsZone()

;Disables dragging the Chrome window by the Title Bar
WinSet, Style, -0x40000, Chrome

;The below disables the keys that can be used for a Chrome kiosk

;Disables double clicking in Chrome
;specifically for the purpose of disabling minimizing the Chrome window by
;double clicking the title bar
#IfWinActive, Chrome
CoordMode, Mouse, Relative
$*LButton::
    ocmx := cmx
    ocmy := cmy
    MouseGetPos, cmx, cmy
    if (cmx >= pBtnDataDict["Top Left X"]) && (cmx <= pBtnDataDict["Bottom Right X"]) && (cmy >= pBtnDataDict["Top Left Y"]) && (cmy <= pBtnDataDict["Bottom Right Y"])
        Click Down
    else if (cmx >= offDataDict["Top Left X"]) && (cmx <= offDataDict["Bottom Right X"]) && (cmy >= offDataDict["Top Left Y"]) && (cmy <= offDataDict["Bottom Right Y"])
        Return
    if (ocmy != cmy) || (ocmx != cmx) || (A_TimeSincePriorHotkey > 500) || (A_TimeSincePriorHotkey > DllCall("GetDoubleClickTime"))
        Click Down
    winTitle = ""
    Return

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
#r::
Suspend, Off
Reload
;WinHide, ahk_class Shell_TrayWnd
;WinSet, Style, -0x40000, Chrome
;WinWaitActive, Google Chrome
;Sleep 500
;CreatePrinterButton()
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
Gui, Destroy
Return
}
