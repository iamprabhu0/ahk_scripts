f1::
{ 
    global 
    MouseGetPos(, , &WhichWindow, &WhichControl)
    ControlGetPos(&x, &y, &w, &h, WhichControl, "ahk_id " WhichWindow)
    Controlhide(WhichControl,"ahk_id " WhichWindow)
    return
}

f2::
{ 
    global
    Controlshow(WhichControl,"ahk_id " WhichWindow)
    return
}
