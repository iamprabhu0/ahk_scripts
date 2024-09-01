^F9::
{ 
  AdjustScreenBrightness(-5)
  Return
} 
  
^F10::
{ 
  AdjustScreenBrightness(5)
  Return
} 
  
AdjustScreenBrightness(step) {
    service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
    monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
    monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")
    minBrightness := 0  

    for i in monitors {
        curt := i.CurrentBrightness
        break
    }
    if (curt < minBrightness)  
        curt := minBrightness
    toSet := curt + step
    if (toSet > 100)
        return
    if (toSet < minBrightness)
        toSet := minBrightness
    
    for i in monMethods {
        i.WmiSetBrightness(1, toSet)
        break
    }
    BrightnessTooltip(toSet)
}

BrightnessTooltip(level) {
    ToolTip("Brightness Level: " level)
    Sleep(600)
    ToolTip()
}