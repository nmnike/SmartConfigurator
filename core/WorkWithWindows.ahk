#IfWinActive ahk_class V8TopLevelFrame

getWindowType() {

	ControlGetFocus, WinType

	If (WinType = "V8Window4") {
		Return "TextEditor"
	}

	If (WinType = "V8Window2") {
		Return "TextEditor"
	}

	If (WinType = "V8Window3") {
		Return "TextEditor"
	}

	return "unknown"
	
}

ActivateWindowByTitle(wndTitle) {

	detect_hidden = 1
	WinGet controls, ControlListHwnd
	static WINDOW_TEXT_SIZE := 32767 ; Defined in AutoHotkey source.
	VarSetCapacity(buf, WINDOW_TEXT_SIZE * (A_IsUnicode ? 2 : 1))
	text := ""
	Loop Parse, controls, `n
	{
		;if !detect_hidden && !DllCall("IsWindowVisible", "ptr", A_LoopField)
		;	continue
		if !DllCall("GetWindowText", "ptr", A_LoopField, "str", buf, "int", WINDOW_TEXT_SIZE)
			continue
		if (buf = wndTitle) {
			WinActivate, ahk_id %A_LoopField%
			Break
		} 
	}
	
}