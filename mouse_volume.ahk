SendMode("Input") ; Recommended for better speed and reliability

#HotIf MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send("{Volume_Up}")
WheelDown::Send("{Volume_Down}")
MButton::Send("{Volume_Mute}")

MouseIsOver(WinTitle) {
    MouseGetPos(, , &Win)
    return WinExist(WinTitle . " ahk_id " . Win)
}