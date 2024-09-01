f1::
{ 
    global 
    MouseGetPos(, , &WhichWindow, &WhichControl)
    ControlGetPos(&x, &y, &w, &h, WhichControl, "ahk_id " WhichWindow)
    MsgBox("the control is `"" WhichControl "`"")
    return
}

f2::
{ 
    global 
    ControlMove(X, Y, W, 0, WhichControl, "ahk_id " WhichWindow)
    Sleep(1000)
    ControlMove(X, Y, W, "H", WhichControl, "ahk_id " WhichWindow)
    return
} 

f3::
{ 
    global 
    Controlhide(WhichControl,"ahk_id " WhichWindow)
    Sleep(1000)
    Controlshow(WhichControl,"ahk_id " WhichWindow)
    return
} 