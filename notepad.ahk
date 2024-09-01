Explorer_GetSelection() {
   winClass := WinGetClass("ahk_id" . hWnd := WinExist("A"))
   if !(winClass ~= "^(Progman|WorkerW|(Cabinet|Explore)WClass)$")
      Return
   
   shellWindows := ComObject("Shell.Application").Windows
   if (winClass ~= "Progman|WorkerW")  
      shellFolderView := shellWindows.Item( ComValue(VT_UI4 := 0x13, SWC_DESKTOP := 0x8) ).Document
   else {
      for window in shellWindows    
         if (hWnd = window.HWND) && (shellFolderView := window.Document)
            break
   }
   result := ""
   for item in shellFolderView.SelectedItems
      result .= (result = "" ? "" : "`n") . item.Path
   if !result
      result := shellFolderView.Folder.Self.Path
   Return result
}

^g:: Run Format('notepad.exe "{1}"', Explorer_GetSelection())