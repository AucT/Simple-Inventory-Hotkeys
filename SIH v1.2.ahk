  #UseHook
  #SingleInstance
  #NoEnv
  setbatchlines -1
  setkeydelay -1
  SetWorkingDir %A_ScriptDir%
  VK_LIST = VK41,VK42,VK43,VK44,VK45,VK46,VK47,VK48,VK49,VK4A,VK4B,VK4C,VK4D,VK4E,VK4F,VK50,VK51,VK52,VK53,VK54,VK55,VK56,VK57,VK58,VK59,VK5A,VKC0,VK30,VK31,VK32,VK33,VK34,VK35,VK36,VK37,VK38,VK39
  HK_LIST = A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,``,0,1,2,3,4,5,6,7,8,9

  configCreated:=0

  Menu, tray, NoStandard
  Menu, tray, add, Configuration, configuration
  Menu, tray, Default, Configuration
  Menu, tray, add
  Menu, tray, add, About, About
  Menu, tray, add
  Menu, tray, add, Exit


ifExist, %A_WorkingDir%\sih.ini
{
  IniRead, h1, %A_WorkingDir%\sih.ini, Inventory, item1, %A_Space%
  IniRead, h2, %A_WorkingDir%\sih.ini, Inventory, item2, %A_Space%
  IniRead, h3, %A_WorkingDir%\sih.ini, Inventory, item3, %A_Space%
  IniRead, h4, %A_WorkingDir%\sih.ini, Inventory, item4, %A_Space%
  IniRead, h5, %A_WorkingDir%\sih.ini, Inventory, item5, %A_Space%
  IniRead, h6, %A_WorkingDir%\sih.ini, Inventory, item6, %A_Space%

  IniRead, h7, %A_WorkingDir%\sih.ini, Options, toggle, %A_Space%
  IniRead, h8, %A_WorkingDir%\sih.ini, Options, pause, %A_Space%

  IniRead, chat, %A_WorkingDir%\sih.ini, Options, chat, %A_Space%
  IniRead, autodetect, %A_WorkingDir%\sih.ini, Options, autodetect, %A_Space%
  IniRead, DONTshowConfig, %A_WorkingDir%\sih.ini, Options, DONTshowConfig, %A_Space%
  IniRead, ScrollIndicator, %A_WorkingDir%\sih.ini, Options, ScrollIndicator, %A_Space%
  IniRead, RunOnStart, %A_WorkingDir%\sih.ini, Options, RunOnStart, %A_Space%

} else {
  h1=!q
  h2=!w
  h3=!a
  h4=!s
  h5=!z
  h6=!x
  h7=Home
  h8=!P
  autodetect:=1
  chat:=1
  DONTshowConfig:=0
  ScrollIndicator:=1
  RunOnStart:=0

  Gosub, WriteIni

}

  vh1:=VK(h1)
  vh2:=VK(h2)
  vh3:=VK(h3)
  vh4:=VK(h4)
  vh5:=VK(h5)
  vh6:=VK(h6)
  vh7:=VK(h7)
  vh8:=VK(h8)

if %autodetect%
{
	if %h1%
	Hotkey, %vh1%, h1D
	Hotkey, +%vh1%, h1SD
	if %h2%
	Hotkey,%vh2%, h2D
	Hotkey,+%vh2%, h2SD
	if %h3%
	Hotkey,%vh3%, h3D
	Hotkey,+%vh3%, h3SD
	if %h4%
	Hotkey,%vh4%, h4D
	Hotkey,+%vh4%, h4SD
	if %h5%
	Hotkey,%vh5%, h5D
	Hotkey,+%vh5%, h5SD
	if %h6%
	Hotkey,%vh6%, h6D
	Hotkey,+%vh6%, h6SD
}
else {
	if %vh1%
	Hotkey,%vh1%, h1
	Hotkey,+%vh1%, h1S
	if %vh2%
	Hotkey,%vh2%, h2
	Hotkey,+%vh2%, h2S
	if %vh3%
	Hotkey,%vh3%, h3
	Hotkey,+%vh3%, h3S
	if %vh4%
	Hotkey,%vh4%, h4
	Hotkey,+%vh4%, h4S
	if %vh5%
	Hotkey,%vh5%, h5
	Hotkey,+%vh5%, h5S
	if %vh6%
	Hotkey,%vh6%, h6
	Hotkey,+%vh6%, h6S
}

if %chat%
{
Hotkey,*Enter, SendEnt
Hotkey,*NumpadEnter, SendEnt
Hotkey, ~*Esc, KEYSON
Hotkey, ~LButton, KEYSON
}

if %RunOnStart%
FileCreateShortcut , %A_ScriptDir%\%A_ScriptName%, %A_Startup%\SIH.lnk
else{
IfExist %A_Startup%\SIH.lnk
FileDelete, %A_Startup%\SIH.lnk
}
if %ScrollIndicator%
SetScrollLockState, On
else
SetScrollLockState, Off
if %h7%
Hotkey,%vh7%, ToggleScript
if %h8%
Hotkey,%vh8%, PauseGame
if %DONTshowConfig%
return


configuration:
if %configCreated%
{
gui, show, autosize center, SIH v1.2
}
else {
Gui 1:Default
Gui, Add, Tab2, y0 h190, Inventory|Options
Gui, Tab, Inventory
gui, font, s11, Verdana
Gui, Add, Button, vb1 gSetItem x15 y35 w120 h40 , %h1%
Gui, Add, Button, vb2 gSetItem x155 y35 w120 h40 , %h2%
Gui, Add, Button, vb3 gSetItem x15 y85 w120 h40 , %h3%
Gui, Add, Button, vb4 gSetItem x155 y85 w120 h40 , %h4%
Gui, Add, Button, vb5 gSetItem x15 y135 w120 h40 , %h5%
Gui, Add, Button, vb6 gSetItem x155 y135 w120 h40 , %h6%
gui, font
Gui, Tab, Options
Gui, Add, CheckBox, Checked%chat% vchat x20 y34 h20 , Chat-Suspend
Gui, Add, CheckBox, Checked%autodetect% vautodetect x+5 h20 , Lobby-Suspend

Gui, add, checkbox, Checked%ScrollIndicator% vScrollIndicator x20 y64, Scroll Indicator
Gui, add, checkbox, Checked%RunOnStart% vRunOnStart  x+2, Run on startup

Gui, add, hotkey, vh7 gSetOption1 x20 y+15 w60, %h7%
gui, add, text, x+5, Activate/Deactivate Tool

gui, add, hotkey, vh8 gSetOption2 x20 y+20 w60, %h8%
gui, add, text, x+5, Pause Game

Gui, Add, CheckBox, Checked%DONTshowConfig% vDONTshowConfig x20 y+10 h20 , Don't show it again

gui, tab




Gui, Add, Button, x15 w83 h25 gSave, Save
gui, add, button, x+5 w83 h25 gtoTray, Hide
Gui, Add, Button, x+5 w83 h25 gExit, Exit

gui, show, autosize center, SIH v1.2
configCreated:=1
}
return

SetOption1:
if %A_GuiControl%
loop, 8
{
if (%A_GuiControl%=h%A_Index% and A_Index!=7)
{
GuiControl,,%A_GuiControl%,
MsgBox 262160, Error ,Dublicate Hotkeys not allowed
return
}
}
return

SetOption2:
if %A_GuiControl%
loop, 8
{
if (%A_GuiControl%=h%A_Index% and A_Index!=8)
{
GuiControl,,%A_GuiControl%,
MsgBox 262160, Error ,Dublicate Hotkeys not allowed
return
}
}
return

SetItem:
ChoosenB=%A_GuiControl%



Gui, 2:Add, GroupBox, w220 h50, Modifier
gui, 2:add, checkbox, vAltModifier xp+15 yp+20 gHotkey_UpdateHotkey, &Alt
gui, 2:add, checkbox, vCtrlModifier x+0 gHotkey_UpdateHotkey, &Ctrl
gui, 2:add, checkbox, vShiftModifier x+0 gHotkey_UpdateHotkey, &Shift
gui, 2:add, checkbox, vWinModifier x+0 gHotkey_UpdateHotkey, &Win

gui, 2:add, groupbox,x10 w220 h180, Keys

gui, 2:add, radio, xp+5 yp+30 vRadioKey gHotkey_UpdateKeyList Checked, Standart
gui, 2:add, radio, y+10 gHotkey_UpdateKeyList, Function
gui, 2:add, radio, y+10 gHotkey_UpdateKeyList, Numpad
gui, 2:add, radio, y+10 gHotkey_UpdateKeyList, Mouse
gui, 2:add, radio, y+10 gHotkey_UpdateKeyList, Multimedia
gui, 2:add, radio, y+10 gHotkey_UpdateKeyList, None

gui, 2:add, listbox, x110 y85 w120 h150 vHG_Key gHotkey_UpdateHotkey
gosub, Hotkey_UpdateKeyList

gui, 2:add, text, x10 y250 w40 h20, Key:
gui, 2:add, edit, vhotkeyshow x+5 w190 h20 +readonly

gui, 2:add, text, x10 y+5 w40 h20, Desc:
gui, 2:add, text, vdescshow x+5 w190 h20 +readonly, None

gui, 2:add, button, x25 y300 w100 h30 gHotkey_AcceptButton, Accept
gui, 2:add, button, x+5 w100 h30 gHotkeyClose, Cancel

gui, 2:show, autosize center, Choose hotkey...

return


HotkeyClose:
gui, 2:destroy
return

toTray:
gui, 1:hide
return

Hotkey_AcceptButton:
Gui, Submit
loop, 8
{
if %HG_Hotkey%
{
if (HG_Hotkey=h%A_Index%)
{
gui, 2:destroy
MsgBox 262160, Error ,Dublicate Hotkeys not allowed
return
}
}
}
if ChoosenB=b1
h1=%HG_Hotkey%
if ChoosenB=b2
h2=%HG_Hotkey%
if ChoosenB=b3
h3=%HG_Hotkey%
if ChoosenB=b4
h4=%HG_Hotkey%
if ChoosenB=b5
h5=%HG_Hotkey%
if ChoosenB=b6
h6=%HG_Hotkey%

gui, 2:destroy
hDialog:=0
Gui 1:Default
GuiControl Text, %ChoosenB%, %HG_Hotkey%
return

Hotkey_UpdateKeyList:
Gui 2:Default
Gui, Submit, Nohide
GUIControl -Redraw,HG_Key
if (RadioKey = 1)
GuiControl,, HG_Key, |a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|1|2|3|4|5|6|7|8|9|0|``|-|=|\|[|]|;|''|,|.|/|Space|Tab|Enter|Escape|Backspace|Delete|ScrollLock|CapsLock|NumLock|PrintScreen|CtrlBreak|Pause|Break|Up|Down|Left|Right|Home|End|Insert|Page Up|Page Down
if (RadioKey = 2)
GuiControl,, HG_Key, |F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|LWin|RWin|LControl|RControl|LShift|RShift|LAlt|RAlt
if (RadioKey = 3)
GuiControl,, HG_Key, |Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpadmult|NumpadAdd|NumpadSub|NumpadDiv|NumpadDot|NumpadEnter
if (RadioKey = 4)
GuiControl,, HG_Key, |LButton|RButton|MButton|WheelUp|WheelDown|XButton1|XButton2
if (RadioKey = 5)
GuiControl,, HG_Key, |Browser_back|Browser_forward|Browser_refresh|Browser_stop|Browser_search|Browser_favorites|Browser_home|volume_mute|volume_down|volume_up|Media_next|Media_prev|Media_stop|Media_play_h8|launch_media|launch_mail|launch_app1|launch_app2|Help|Sleep
if (RadioKey = 6)
GuiControl,, HG_Key,
GUIControl +Redraw,HG_Key
return


Hotkey_UpdateHotkey:
gui, submit, nohide
HG_Hotkey=
HG_HKDesc=
    if CtrlModifier
        {
        HG_Hotkey:=HG_Hotkey . "^"
        HG_HKDesc:=HG_HKDesc . "Ctrl + "
        }

    if ShiftModifier
        {
        HG_Hotkey:=HG_Hotkey . "+"
        HG_HKDesc:=HG_HKDesc . "Shift + "
        }

    if WinModifier
        {
        HG_Hotkey:=HG_Hotkey . "#"
        HG_HKDesc:=HG_HKDesc . "Win + "
        }

    if AltModifier
        {
        HG_Hotkey:=HG_Hotkey . "!"
        HG_HKDesc:=HG_HKDesc . "Alt + "
        }

	HG_Hotkey:=HG_Hotkey . HG_Key
    HG_HKDesc:=HG_HKDesc . HG_Key

    GUIControl ,,hotkeyshow,%HG_Hotkey%
    GUIControl ,,descshow,%HG_HKDesc%
return


Save:
gui, submit, nohide
gosub, WriteIni
reload
return

Exit:
ExitApp
return

About:
Run http://sih.isgreat.org/index.html
return

2GuiEscape:
2GuiClose:
gui, 2:destroy
return

GuiEscape:
GuiClose:
gui, hide
return

WriteIni:
  IniWrite, %h1%, %A_WorkingDir%\sih.ini, Inventory, item1
  IniWrite, %h2%, %A_WorkingDir%\sih.ini, Inventory, item2
  IniWrite, %h3%, %A_WorkingDir%\sih.ini, Inventory, item3
  IniWrite, %h4%, %A_WorkingDir%\sih.ini, Inventory, item4
  IniWrite, %h5%, %A_WorkingDir%\sih.ini, Inventory, item5
  IniWrite, %h6%, %A_WorkingDir%\sih.ini, Inventory, item6

  IniWrite, %h7%, %A_WorkingDir%\sih.ini, Options, toggle
  IniWrite, %h8%, %A_WorkingDir%\sih.ini, Options, pause

  IniWrite, %chat%, %A_WorkingDir%\sih.ini, Options, chat
  IniWrite, %autodetect%, %A_WorkingDir%\sih.ini, Options, autodetect
  IniWrite, %DONTshowConfig%, %A_WorkingDir%\sih.ini, Options, DONTshowConfig
  IniWrite, %ScrollIndicator%, %A_WorkingDir%\sih.ini, Options, ScrollIndicator
  IniWrite, %RunOnStart%, %A_WorkingDir%\sih.ini, Options, RunOnStart

return


#IfWinActive Warcraft III
h1:
send {vk67}
return
h1S:
sendplay +{vk67}
return


h2:
send {vk68}
return
h2S:
sendplay +{vk68}
return


h3:
send {vk64}
return
h3S:
sendplay +{vk64}
return

h4:
send {vk65}
return
h4S:
sendplay +{vk65}
return


h5:
send {vk61}
return
h5S:
sendplay +{vk61}
return

h6:
send {vk62}
return
h6S:
sendplay +{vk62}
return



h1D:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
send {vk67}
else
send {%h1%}
return
h1SD:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
sendplay +{vk67}
else
sendplay +{%h1%}
return


h2D:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
send {vk68}
else
send {%h2%}
return
h2SD:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
sendplay +{vk68}
else
sendplay +{%h2%}
return


h3D:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
send {vk64}
else
send {%h3%}
return
h3SD:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
sendplay +{vk64}
else
sendplay +{%h3%}
return

h4D:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
send {vk65}
else
send {%h4%}
return
h4SD:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
sendplay +{vk65}
else
sendplay +{%h4%}
return


h5D:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
send {vk61}
else
send {%h5%}
return
h5SD:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
sendplay +{vk61}
else
sendplay +{%h5%}
return

h6D:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
send {vk62}
else
send {%h6%}
return
h6SD:
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color=0x000000
sendplay +{vk62}
else
sendplay +{%h6%}
return


KEYSON:
Suspend, Permit
Suspend, Off
if %ScrollIndicator%
SetScrollLockState, On
return

SendEnt:
Suspend, Permit
if %autodetect%
{
PixelGetColor, color, A_ScreenWidth*0.738, A_ScreenHeight*0.019
if color!=0x000000
{
Send, {Blind}{Enter}
return
}
}

Suspend
Send, {Blind}{Enter}
	if %ScrollIndicator%
	{
	if A_IsSuspended
		SetScrollLockState, Off
	Else
		SetScrollLockState, On
	}

return


ToggleScript:
Suspend
if %chat%
{
if !A_IsSuspended{
   Hotkey,*Enter, SendEnt,on
   Hotkey,*NumpadEnter, SendEnt,on
   Hotkey, ~*Esc, KEYSON,on
   Hotkey, ~LButton, KEYSON,on
   if %ScrollIndicator%
   SetScrollLockState, On
}
Else{
   Hotkey,*Enter, SendEnt,off
   Hotkey,*NumpadEnter, SendEnt,off
   Hotkey, ~*Esc, KEYSON,off
   Hotkey, ~LButton, KEYSON,off
   if %ScrollIndicator%
   SetScrollLockState, Off
}
}
return


PauseGame:
sendplay {vk79}{vk4D}{vk52}
return


VK(Param)
{
   global
   Hotkey:=RegExReplace(Param, "[\^\!\+\#]+(.*)", "$1")
   If StrLen(Hotkey) > 1
      return Param
   Loop, parse, HK_LIST, CSV
      If (Hotkey = A_LoopField)
      {
         Index := A_Index
         Loop, parse, VK_LIST, CSV
            If (A_Index = Index)
               return % RegExReplace(Param, "(.*)" Hotkey, "$1" A_LoopField)
      }
}
