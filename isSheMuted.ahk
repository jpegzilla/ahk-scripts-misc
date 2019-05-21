SetFormat, Integer, Hex
Gui +ToolWindow +SysMenu +AlwaysOnTop +OwnDialogs +Owner -Resize
Gui, Font, s32 Bold, Arial
Gui, Add, Text, w300 h100 vSC 0x201 c10CB24, NOT MUTED
WinGetPos, winX, winY, winWidth, winHeight, A
Gui, Show,, % "Your microphone is now:"
Loop 9
  OnMessage( 255+A_Index, "ScanCode" ) ; 0x100 to 0x108
Return

ScanCode( wParam, lParam ) {
 Clipboard := "SC" SubStr((((lParam>>16) & 0xFF)+0xF000),-2)
 GuiControl,, SC, %Clipboard%
}
