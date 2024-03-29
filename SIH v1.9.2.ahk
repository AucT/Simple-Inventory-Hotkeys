RegRead, UAC, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System, EnableLUA

  #SingleInstance force
  #HotkeyInterval 0
  #InstallKeybdHook 
  #UseHook on
  #NoEnv
  #MaxThreads
  Process, priority, , High
  SetWorkingDir %A_ScriptDir%
  SetBatchLines, -1
  SetKeyDelay , -1, -1
  SetDefaultMouseSpeed, 0
  configCreated:=0
  GroupAdd, WC3DOTA , Warcraft III
  GroupAdd, WC3DOTA , DOTA 2
  VK_LIST = VK41,VK42,VK43,VK44,VK45,VK46,VK47,VK48,VK49,VK4A,VK4B,VK4C,VK4D,VK4E,VK4F,VK50,VK51,VK52,VK53,VK54,VK55,VK56,VK57,VK58,VK59,VK5A,VK30,VK31,VK32,VK33,VK34,VK35,VK36,VK37,VK38,VK39,VKC0,VKDB,VKDD,VKBE,VKBF,VKBA,VKDE
  HK_LIST = A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9,``,[,],.,/,;,'


  Menu, tray, NoStandard
  Menu, Tray, Click, 1
  Menu, tray, add, Configuration, configuration
  Menu, tray, Default, Configuration
  Menu, tray, add, Mouse Capture, SetWMC
  Menu, tray, add
  Menu, tray, add, About, About
  Menu, tray, add
  Menu, tray, add, Exit
  Menu, Tray, Icon, %A_ScriptDir%\%A_ScriptName%,1,1


  IniRead, h1, %A_WorkingDir%\SIH.ini, Inventory, item1, %A_Space%
  IniRead, h2, %A_WorkingDir%\SIH.ini, Inventory, item2, %A_Space%
  IniRead, h3, %A_WorkingDir%\SIH.ini, Inventory, item3, %A_Space%
  IniRead, h4, %A_WorkingDir%\SIH.ini, Inventory, item4, %A_Space%
  IniRead, h5, %A_WorkingDir%\SIH.ini, Inventory, item5, %A_Space%
  IniRead, h6, %A_WorkingDir%\SIH.ini, Inventory, item6, %A_Space%


  IniRead, h7, %A_WorkingDir%\SIH.ini, Others, LearnSkills, CapsLock
  IniRead, h8, %A_WorkingDir%\SIH.ini, Others, Scoreboard, ``
  IniRead, sbX, %A_WorkingDir%\SIH.ini, Others, sbX,%A_Space%
  IniRead, sbY, %A_WorkingDir%\SIH.ini, Others, sbY,%A_Space%
  IniRead, h9, %A_WorkingDir%\SIH.ini, Others, Autocast, !F
  IniRead, h10, %A_WorkingDir%\SIH.ini, Others, Hold, %A_Space%
  
  IniRead, Chatfree, %A_WorkingDir%\SIH.ini, Others, Chatfree, 0

  IniRead, DONTshowConfig, %A_WorkingDir%\SIH.ini, Others, DONTshowConfig, 0
  IniRead, TMPHIDE, %A_WorkingDir%\SIH.ini, Others,TMPHIDE, 0
  IniRead, ShieldLWin, %A_WorkingDir%\SIH.ini, Others, ShieldLWin, 0
  IniRead, RunAtStart, %A_WorkingDir%\SIH.ini, Others, RunAtStart, 0
  IniRead, CustomGroups, %A_WorkingDir%\SIH.ini, Others, CustomGroups, 0

  IniRead, Toggle, %A_WorkingDir%\SIH.ini, Others, Toggle, Home

  IniRead, WMC, %A_WorkingDir%\SIH.ini, Others, WMC, 0
  if WMC {
  menu, tray, check, Mouse Capture
  SetTimer,CheckActiveWar3
  }

  Hotkey, IfWinActive, ahk_group WC3DOTA
  loop {
	  i:=A_Index+10
	  IniRead, h%i%, %A_WorkingDir%\SIH.ini, Messages, hotkey%A_Index%, %A_Space%
	  if h%i% {
		  vh%i%:=VK(h%i%)
		  Hotkey, % vh%i%, Message%A_Index%
		  IniRead, Mes%A_Index%, %A_WorkingDir%\SIH.ini, Messages, message%A_Index%
		  IniRead, toAll%A_Index%, %A_WorkingDir%\SIH.ini, Messages, toAll%A_Index%,0
		  StringReplace, Mes%A_Index%, Mes%A_Index%,\n,`n, All
	  }
	  else
	  break
  }

  vh1:=VK(h1)
  vh2:=VK(h2)
  vh3:=VK(h3)
  vh4:=VK(h4)
  vh5:=VK(h5)
  vh6:=VK(h6)
  vh7:=VK(h7)
  vh8:=VK(h8)
  vh9:=VK(h9)
  vh10:=VK(h10)
	if vh1
	{
		if h1=Space
		{
		if (Chatfree) {
		Hotkey,%vh1%, Spaceh1
		Hotkey,+%vh1%, Spaceh1
		} else {
		Hotkey,%vh1%, Spaceh1NB
		Hotkey,+%vh1%, Spaceh1NB
		}
		}
		else if StrLen(h1)=1 {
		
		if (Chatfree) {
		Hotkey,~%vh1%, h1
		Hotkey,~+%vh1%, h1
		} else {
		Hotkey,%vh1%, h1NB
		Hotkey,+%vh1%, h1NB
		}
		}
		else {
		if (Chatfree) {
		Hotkey,%vh1%, h1
		if (!InStr(vh1, "&"))
		Hotkey,+%vh1%, h1
		}
		else {
		Hotkey,%vh1%, h1NB
		if (!InStr(vh1, "&"))
		Hotkey,+%vh1%, h1NB
		}
		}
	}
	if vh2
	{
		if h2=Space
		{
		if (Chatfree) {
		Hotkey,%vh1%, Spaceh2
		Hotkey,+%vh1%, Spaceh2
		} else {
		Hotkey,%vh2%, Spaceh2NB
		Hotkey,+%vh2%, Spaceh2NB
		}
		}
		else if StrLen(h2)=1 {
		if (Chatfree) {
		Hotkey,~%vh2%, h2
		Hotkey,~+%vh2%, h2
		}
		else {
		Hotkey,%vh2%, h2NB
		Hotkey,+%vh2%, h2NB
		}
		}
		else {
		if (Chatfree) {
		Hotkey,%vh2%, h2
		if (!InStr(vh2, "&"))
		Hotkey,+%vh2%, h2
		}
		else {
		Hotkey,%vh2%, h2NB
		if (!InStr(vh2, "&"))
		Hotkey,+%vh2%, h2NB
		}
		}
	}
	if vh3
	{
		if h3=Space
		{
		if (Chatfree) {
		Hotkey,%vh3%, Spaceh3
		Hotkey,+%vh3%, Spaceh3
		}
		else {
		Hotkey,%vh3%, Spaceh3NB
		Hotkey,+%vh3%, Spaceh3NB
		}
		}
		else if StrLen(h3)=1 {
		if (Chatfree) {
		Hotkey,~%vh3%, h3
		Hotkey,~+%vh3%, h3
		}
		else {
		Hotkey,%vh3%, h3NB
		Hotkey,+%vh3%, h3NB
		}
		}
		else {
		if (Chatfree) {
		Hotkey,%vh3%, h3
		if (!InStr(vh3, "&"))
		Hotkey,+%vh3%, h3
		}
		else {
		Hotkey,%vh3%, h3NB
		if (!InStr(vh3, "&"))
		Hotkey,+%vh3%, h3NB
		}
		}
	}
	if vh4
	{
		if h4=Space
		{
		if (Chatfree) {
		Hotkey,%vh4%, Spaceh4
		Hotkey,+%vh4%, Spaceh4
		}
		else {
		Hotkey,%vh4%, Spaceh4NB
		Hotkey,+%vh4%, Spaceh4NB
		}
		}
		else if StrLen(h4)=1 {
		if (Chatfree) {
		Hotkey,~%vh4%, h4
		Hotkey,~+%vh4%, h4
		}
		else {
		Hotkey,%vh4%, h4NB
		Hotkey,+%vh4%, h4NB
		}
		}
		else {
		if (Chatfree) {
		Hotkey,%vh4%, h4
		if (!InStr(vh4, "&"))
		Hotkey,+%vh4%, h4
		}
		else {
		Hotkey,%vh4%, h4NB
		if (!InStr(vh4, "&"))
		Hotkey,+%vh4%, h4NB
		}
		}
	}
	if vh5
	{
		if h5=Space
		{
		if (Chatfree) {
		Hotkey,%vh5%, Spaceh5
		Hotkey,+%vh5%, Spaceh5
		}
		else {
		Hotkey,%vh5%, Spaceh5NB
		Hotkey,+%vh5%, Spaceh5NB
		}
		}
		else if StrLen(h5)=1 {
		if (Chatfree) {
		Hotkey,~%vh5%, h5
		Hotkey,~+%vh5%, h5
		}
		else {
		Hotkey,%vh5%, h5NB
		Hotkey,+%vh5%, h5NB
		}
		}
		else {
		if (Chatfree) {
		Hotkey,%vh5%, h5
		if (!InStr(vh5, "&"))
		Hotkey,+%vh5%, h5
		}
		else {
		Hotkey,%vh5%, h5NB
		if (!InStr(vh5, "&"))
		Hotkey,+%vh5%, h5NB
		}
		}
	}
	if vh6
	{
		if h6=Space
		{
		if (Chatfree) {
		Hotkey,%vh6%, Spaceh6
		Hotkey,+%vh6%, Spaceh6
		}
		else {
		Hotkey,%vh6%, Spaceh6NB
		Hotkey,+%vh6%, Spaceh6NB
		}
		}
		else if StrLen(h6)=1 {
		if (Chatfree) {
		Hotkey,~%vh6%, h6
		Hotkey,~+%vh6%, h6
		}
		else {
		Hotkey,%vh6%, h6NB
		Hotkey,+%vh6%, h6NB
		}
		}
		else {
		if (Chatfree) {
		Hotkey,%vh6%, h6
		if (!InStr(vh6, "&"))
		Hotkey,+%vh6%, h6
		}
		else {
		Hotkey,%vh6%, h6NB
		if (!InStr(vh6, "&"))
		Hotkey,+%vh6%, h6NB
		}
		}
	}

Hotkey,!vkDB, ShowAHP
Hotkey,!vkDD, ShowEHP
Hotkey,!vk50, PauseGame

if ShieldLWin
Hotkey, vk5B, disableK

if RunAtStart
FileCreateShortcut , %A_ScriptDir%\%A_ScriptName%, %A_Startup%\SIH.lnk
else{
IfExist %A_Startup%\SIH.lnk
FileDelete, %A_Startup%\SIH.lnk
}

if h7 {
if (StrLen(h7)=1 and h7!="``")
if (Chatfree) {
Hotkey,~%vh7%, SendO2
}
else {
Hotkey,%vh7%, SendO2NB
}
else {
SetTimer, UnsendO, 2000
SetTimer, UnsendO, off

if (Chatfree) {
Hotkey,%vh7%, SendO
}
else {
Hotkey,%vh7%, SendONB
}
}
}
if !sbX
sbX:=189/192
else
sbX:=sbX/A_ScreenWidth
if !sbY
sbY:=7/120
else
sbY:=sbY/A_ScreenHeight
if h8 {
if UAC
Hotkey,%vh8%, ScoreBoardUAC
else
Hotkey,%vh8%, ScoreBoard
}
if h9 {
if UAC
Hotkey,%vh9%, AutoCastUAC
else
Hotkey,%vh9%, AutoCast
}
if h10 {
if (Chatfree) {
Hotkey,~%vh10%,Hold
}
else {
Hotkey,%vh10%,HoldNB
}
}


if CustomGroups
{
Hotkey, F2, group1
Hotkey, F3, group2
Hotkey, F4, group3
Hotkey, +F2, group1
Hotkey, +F3, group2
Hotkey, +F4, group3
Hotkey, ^F2, group1
Hotkey, ^F3, group2
Hotkey, ^F4, group3
}

Hotkey, ifWinActive
if %Toggle%
Hotkey,% VK(Toggle), ToggleScript
Hotkey, IfWinActive, Garena
Hotkey,!vk4A, Garena
Hotkey, ifWinActive
if TMPHIDE {
EmptyMem()
IniWrite, 0, %A_WorkingDir%\SIH.ini, Others, TMPHIDE
return
}
if DONTshowConfig
{
TrayTip,SIH,I'm here, 5,1
EmptyMem()
return
}

configuration:
if %configCreated%
{
gui, show, autosize center, SIH v1.9.2
}
else {
Gui 1:Default
Gui, Add, Tab2, y0 h200, Inventory|Others|Messages|Readme
Gui, Tab, Inventory
gui, font, s11, Verdana
Gui, Add, Button, vb1 gSetItem x15 y35 w120 h40 , %h1%
Gui, Add, Button, vb2 gSetItem x155 y35 w120 h40 , %h2%
Gui, Add, Button, vb3 gSetItem x15 y85 w120 h40 , %h3%
Gui, Add, Button, vb4 gSetItem x155 y85 w120 h40 , %h4%
Gui, Add, Button, vb5 gSetItem x15 y135 w120 h40 , %h5%
Gui, Add, Button, vb6 gSetItem x155 y135 w120 h40 , %h6%
gui, font
Gui, Tab, Others

Gui, add, checkbox, Checked%ShieldLWin% vShieldLWin x20 y34, Shield LWin
Gui, add, checkbox, Checked%RunAtStart% vRunAtStart  x+7, Run at Start
Gui, add, checkbox, Checked%CustomGroups% vCustomGroups x20 y+10, Func-Groups
Gui, Add, CheckBox, Checked%DONTshowConfig% vDONTshowConfig x+2 , Don't show it again

Gui, add, button,vb7 gSetItem x15 y+10 w60, %h7%
gui, add, text, x+5,Learn (O)

Gui, add, button,vb10 gSetItem x+5 w60, %h10%
gui, add, text, x+5,Hold (H)

gui, add, button,vb8 gSetItem x15 y+15 w60, %h8%
gui, add, text, x+5,Show Scoreboard

Gui, add, button,vb9 gSetItem x15 y+15 w60, %h9%
gui, add, text, x+5,AutoCast

Gui, Add, CheckBox, Checked%Chatfree% vChatfree x15 y+15, Chat-free (send backspace after hotkey usage).`nCan conflict with new dota maps (move to fountain).


Gui, Tab, Messages
gui, add, button, w140 h25 gAddMes, Add Message
gui, add, button, x+5 w100 h25 gChangeMes, Change
gui, add, button, x20 y+5 w140 h30 vHotkeyChoose_Mes gSetItem, HOTKEY
Gui, Add, ListBox, x+5 w100 h120 vMes_Key gMes_MesUpdate altsubmit
gui, add, checkbox, x23 y95 w100 h20 vtoAll, To All?
gui, add, edit, x20 y+8 w140 h55 vMesEdit
gosub, Mes_KeyUpdate
Gui, Tab, Readme
Readme =
(
Default Hotkeys:
Alt+[ - show ally's hp bar
Alt+] - show enemy's hp bar
Alt+P - Pause/Resume "game"

/setsb - set custom position of scoreboard
/unsetsb - delete custom position of scoreboard
/reload - reloads app

Home - Activate/Deactivate tool
Alt+J - Join to garena room (2xclick)
)

Gui, Font, s10 underline
Gui, Add, Text,x20 y24 cBlue gAbout, SIH - Simple Inventory Hotkeys!
Gui, Font
gui, add, text,y+10,%Readme%

gui, tab

Gui, Add, Button, x15 w83 h25 gSave, &Save
gui, add, button, x+5 w83 h25 gtoTray, &Hide
Gui, Add, Button, x+5 w83 h25 gExit, E&xit

gui, show, autosize center, SIH v1.9.2
configCreated:=1
}
EmptyMem()
return

Mes_KeyUpdate:
  Mes_KeyList=
  loop {
  IniRead, HM, SIH.ini, Messages, hotkey%A_Index%, %A_Space%
  if HM
  Mes_KeyList=%Mes_KeyList%|%HM%
  else
  break
  }
  GuiControl,, Mes_Key,%Mes_KeyList%
return

Mes_MesUpdate:
gui, submit, nohide
IniRead, M, %A_WorkingDir%\SIH.ini, Messages, message%Mes_Key%, %A_Space%
IniRead, H, %A_WorkingDir%\SIH.ini, Messages, hotkey%Mes_Key%, %A_Space%
StringReplace, M, M,\n,`n, All
GUIControl ,,MesEdit,%M%
GUIControl ,,HotkeyChoose_Mes,%H%
if toAll%Mes_Key%
GUIControl ,,toAll,1
else
GUIControl ,,toAll,0
return

AddMes:
gui, submit, nohide
if HotkeyChoose_Mes=
{
MsgBox 262160, Error ,Choose hotkey first!
return
}

StringReplace, MesEdit, MesEdit,`n,\n, All

loop {
IniRead, h, SIH.ini, Messages, hotkey%A_Index%, %A_Space%
  if !h
  {
  i=%A_Index%
  break
  }
}
IniWrite, %HotkeyChoose_Mes%, %A_WorkingDir%\SIH.ini, Messages, hotkey%i%
b:=i+10
h%b%:=HotkeyChoose_Mes
IniWrite, %MesEdit%, %A_WorkingDir%\SIH.ini, Messages, message%i%
if toAll
IniWrite, 1, %A_WorkingDir%\SIH.ini, Messages, toAll%i%
GUIControl ,,toAll,0
gosub, Mes_KeyUpdate
GUIControl ,,HotkeyChoose_Mes,Hotkey
HotkeyChoose_Mes=
return

ChangeMes:
gui, submit, nohide
if HotkeyChoose_Mes
IniWrite, %HotkeyChoose_Mes%, %A_WorkingDir%\SIH.ini, Messages, hotkey%Mes_Key%
StringReplace, MesEdit, MesEdit,`n,\n, All
IniWrite, %MesEdit%, %A_WorkingDir%\SIH.ini, Messages, message%Mes_Key%
if toAll%Mes_Key%
IniWrite, 1, %A_WorkingDir%\SIH.ini, Messages, toAll%Mes_Key%
else
IniWrite, 0, %A_WorkingDir%\SIH.ini, Messages, toAll%Mes_Key%
GUIControl ,,toAll,0
gosub, Mes_KeyUpdate
GUIControl ,,HotkeyChoose_Mes,Hotkey
HotkeyChoose_Mes=
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

Hotkey_AcceptButton:
Gui, Submit
i := SubStr(ChoosenB,2)
loop, 35
{
if MyVar and HG_Hotkey=h%A_Index% {
gui, 2:destroy
HG_Hotkey=
MsgBox 262160, Error ,Dublicate Hotkeys not allowed
return
}
}
h%i%=%HG_Hotkey%
gui, 2:destroy
hDialog:=0
Gui 1:Default
GuiControl Text, %ChoosenB%, %HG_Hotkey%
HG_Hotkey=
return

Hotkey_UpdateKeyList:
Gui 2:Default
Gui, Submit, Nohide
GUIControl -Redraw,HG_Key

if (RadioKey = 1)
GuiControl,, HG_Key, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|``|-|=|\|[|]|;|'|,|.|/|Space|Tab|Enter|Escape|Delete|ScrollLock|CapsLock|NumLock|PrintScreen|BackSpace|CtrlBreak|Pause|Break|Up|Down|Left|Right|Home|End|Insert|Page Up|Page Down
if (RadioKey = 2)
GuiControl,, HG_Key, |F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|LWin|RWin|LControl|RControl|LShift|RShift|LAlt|RAlt
if (RadioKey = 3)
GuiControl,, HG_Key, |Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpadmult|NumpadAdd|NumpadSub|NumpadDiv|NumpadDot|NumpadEnter
if (RadioKey = 4)
GuiControl,, HG_Key, |LButton|RButton|MButton|WheelUp|WheelDown|XButton1|XButton2
if (RadioKey = 5)
GuiControl,, HG_Key, |Browser_back|Browser_forward|Browser_refresh|Browser_stop|Browser_search|Browser_favorites|Browser_home|volume_mute|volume_down|volume_up|Media_next|Media_prev|Media_stop|Media_play_h8|launch_media|launch_mail|launch_app1|launch_app2|Help|Sleep
if (RadioKey = 6)
GuiControl,, HG_Key, |%A_Blank%
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
	if a_guievent = DoubleClick
	gosub, Hotkey_AcceptButton
return

::-1x1::-apshomnp
::-pvp::-apshomnp
::-c::-clear
::-u::-unlock
::-r::-roll
::/setsb::
MouseGetPos, xp, yp
IniWrite, %xp%, %A_WorkingDir%\SIH.ini, Others, sbX
IniWrite, %yp%, %A_WorkingDir%\SIH.ini, Others, sbY
IniWrite, 1, %A_WorkingDir%\SIH.ini, Others, TMPHIDE
send {vk0D}
reload
return

::/unsetsb::
IniDelete, %A_WorkingDir%\SIH.ini, Others, sbX
IniDelete, %A_WorkingDir%\SIH.ini, Others, sbY
IniWrite, 1, %A_WorkingDir%\SIH.ini, Others, TMPHIDE
send {vk0D}
reload
return
::/reload::
IniWrite, 1, %A_WorkingDir%\SIH.ini, Others, TMPHIDE
send {vk0D}
reload
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
Run https://sih.auct.eu/
return

2GuiEscape:
2GuiClose:
gui, 2:destroy
return

toTray:
GuiEscape:
GuiClose:
gui, hide
TrayTip,SIH,I'm here, 3,1
return

WriteIni:
  IniWrite, %h1%, %A_WorkingDir%\SIH.ini, Inventory, item1
  IniWrite, %h2%, %A_WorkingDir%\SIH.ini, Inventory, item2
  IniWrite, %h3%, %A_WorkingDir%\SIH.ini, Inventory, item3
  IniWrite, %h4%, %A_WorkingDir%\SIH.ini, Inventory, item4
  IniWrite, %h5%, %A_WorkingDir%\SIH.ini, Inventory, item5
  IniWrite, %h6%, %A_WorkingDir%\SIH.ini, Inventory, item6

  IniWrite, %h7%, %A_WorkingDir%\SIH.ini, Others, LearnSkills
  IniWrite, %h8%, %A_WorkingDir%\SIH.ini, Others, ScoreBoard
  IniWrite, %h9%, %A_WorkingDir%\SIH.ini, Others, Autocast
  
  
  IniWrite, %Chatfree%, %A_WorkingDir%\SIH.ini, Others, Chatfree
  
  
  IniWrite, %h10%, %A_WorkingDir%\SIH.ini, Others, Hold

  IniWrite, %DONTshowConfig%, %A_WorkingDir%\SIH.ini, Others, DONTshowConfig
  IniWrite, %ShieldLWin%, %A_WorkingDir%\SIH.ini, Others, ShieldLWin
  IniWrite, %RunAtStart%, %A_WorkingDir%\SIH.ini, Others, RunAtStart
  IniWrite, %CustomGroups%, %A_WorkingDir%\SIH.ini, Others, CustomGroups

  IniWrite, %Toggle%, %A_WorkingDir%\SIH.ini, Others, Toggle
return



group1:
Send {blind}8
return
group2:
Send {blind}9
return
group3:
Send {blind}0
return

Spaceh1:
clipp:=clipboard
clipboard:=" "
send {vk67}{vk08}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

Spaceh1NB:
clipp:=clipboard
clipboard:=" "
send {vk67}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

Spaceh2:
clipp:=clipboard
clipboard:=" "
send {vk68}{vk08}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

Spaceh2NB:
clipp:=clipboard
clipboard:=" "
send {vk68}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

Spaceh3:
clipp:=clipboard
clipboard:=" "
send {vk64}{vk08}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return


Spaceh3NB:
clipp:=clipboard
clipboard:=" "
send {vk64}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

Spaceh4:
clipp:=clipboard
clipboard:=" "
send {vk65}{vk08}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

Spaceh4NB:
clipp:=clipboard
clipboard:=" "
send {vk65}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

Spaceh5:
clipp:=clipboard
clipboard:=" "
send {vk61}{vk08}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return


Spaceh5NB:
clipp:=clipboard
clipboard:=" "
send {vk61}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

Spaceh6:
clipp:=clipboard
clipboard:=" "
send {vk62}{vk08}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

Spaceh6NB:
clipp:=clipboard
clipboard:=" "
send {vk62}
sleep, 50
send ^{vk56}
sleep, 50
clipboard:=clipp
return

h1:
send {vk67}{vk08}
return

h1NB:
send {vk67}
return

h2:
send {vk68}{vk08}
return

h2NB:
send {vk68}
return

h3:
send {vk64}{vk08}
return

h3NB:
send {vk64}
return

h4:
send {vk65}{vk08}
return

h4NB:
send {vk65}
return

h5:
send {vk61}{vk08}
return

h5NB:
send {vk61}
return

h6:
send {vk62}{vk08}
return

h6NB:
send {vk62}
return

SendO2:
send {vk4f}{vk08}
return

SendO2NB:
send {vk4f}
return

UnsendO:
sendedo:=0
SetTimer, UnsendO, off
return

SendO:
if sendedo
send {vk1B}
else {
send {vk4f}{vk08}
SetTimer, UnsendO, on
}
sendedo=!sendedo
return

SendONB:
if sendedo
send {vk1B}
else {
send {vk4f}
SetTimer, UnsendO, on
}
sendedo=!sendedo
return

Hold:
send {vk48}{vk08}
return

HoldNB:
send {vk48}
return

disableK:
suspend permit
return

ScoreBoardUAC:
   if _locked {
   x:=left+cWidth*sbX
   y:=top+cHeight*sbY
   }
   else {
   x:=A_ScreenWidth*sbX
   y:=A_ScreenHeight*sbY
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   MouseMove,x,y
   sleep,10
   Click
   Send {Click %x0%,  %y0%, 0}
   BlockInput,MouseMoveOff
return
ScoreBoard:
   if _locked {
   x:=left+cWidth*sbX
   y:=top+cHeight*sbY
   }
   else {
   x:=A_ScreenWidth*sbX
   y:=A_ScreenHeight*sbY
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   sendinput, {Click %x%,  %y%, 0}
   sleep, 80
   Click
   sendinput, {Click %x0%,  %y0%, 0}
   BlockInput,MouseMoveOff
return

AutoCastUAC:
   if _locked {
   x1:=left+cWidth*0.79
   x2:=left+cWidth*0.84
   x3:=left+cWidth*0.9
   x4:=left+cWidth*0.95
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else {
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }

   BlockInput,MouseMove
   MouseGetPos, x0, y0
   MouseClick,Right,x1,y,,0
   MouseClick,Right,x2,y,,0
   MouseClick,Right,x3,y,,0
   MouseClick,Right,x4,y,,0
   MouseClick,Right,x3,y2,,0
   MouseMove,x0,y0
   BlockInput,MouseMoveOff
return

AutoCast:
   if _locked {
   x1:=left+cWidth*0.79
   x2:=left+cWidth*0.84
   x3:=left+cWidth*0.9
   x4:=left+cWidth*0.95
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else {
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   SendPlay, {Click %x1%,  %y%, Right}{Click %x2%,  %y%, Right}{Click %x3%,  %y%, Right}{Click %x4%,  %y%, Right}{Click %x3%,  %y2%, Right}{Click %x0%, %y0%, 0}
   BlockInput,MouseMoveOff
return

Message1:
Message2:
Message3:
Message4:
Message5:
Message6:
Message7:
Message8:
Message9:
Message10:
Message11:
Message12:
Message13:
Message14:
Message15:
Message16:
Message17:
Message18:
Message19:
Message20:
Message21:
Message22:
Message23:
Message24:
Message25:
Message26:
Message27:
Message28:
Message29:
Message30:
Message31:
Message32:
Message33:
Message34:
Message35:
Message36:
Message37:
Message38:
Message39:
Message40:
i := SubStr(A_ThisLabel,8)
loop, parse, Mes%i%, `n
{
if toAll%i%
{
send +{vk0D}
sleep, 30
send {RAW}%A_LoopField%
}
else
{

send {vk0D}
sleep, 30
send {RAW}%A_LoopField%
}
send {vk0D}
sleep, 1
}
return

PauseGame:
send {vk79}{vk4D}{vk52}
return

ShowAHP:
  If AHealthBarOn
    {
      Send, {vkDB Up}
      AHealthBarOn := 0
    }
  Else
    {
      Send, {vkDB Down}
      AHealthBarOn := 1
    }
Return

ShowEHP:
  If EHealthBarOn
    {
      Send, {vkDD Up}
      EHealthBarOn := 0
    }
  Else
    {
      Send, {vkDD Down}
      EHealthBarOn := 1
    }
Return


VK(Param)
{
	global
	if InStr(Param,"[")
	return % RegExReplace(Param, "\[$", "VKDB")
	if InStr(Param,"]")
	return % RegExReplace(Param, "\]$", "VKDD")
	if InStr(Param,"\")
	return % RegExReplace(Param, "\\$", "VKDC")
	if InStr(Param,",")
	return % RegExReplace(Param, "\,$", "VKBC")
	if InStr(Param,".")
	return % RegExReplace(Param, "\.$", "VKBE")
	if InStr(Param,"/")
	return % RegExReplace(Param, "\/$", "VKBF")
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


EmptyMem(PID="SIH v1.9.2"){
    pid:=(pid="SIH v1.9.2") ? DllCall("GetCurrentProcessId") : pid
    h:=DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", pid)
    DllCall("SetProcessWorkingSetSize", "UInt", h, "Int", -1, "Int", -1)
    DllCall("CloseHandle", "Int", h)
}



ToggleScript:
Suspend
return

Garena:
gojoin:=!gojoin
if gojoin
{
gosub, autojoin
sleep 100
SetTimer, autojoin, 5010
}
else
{
ToolTip
SetTimer, autojoin, off
}
return

autojoin:
ToolTip, GarenaJoiner is active
send, {click 2}
sleep, 2000
send {space}
return


SetWMC:
WMC:=!WMC
IniWrite, %WMC%, %A_WorkingDir%\SIH.ini, Others, WMC
menu, tray, togglecheck, Mouse Capture
if WMC
SetTimer,CheckActiveWar3
else
{
SetTimer,CheckActiveWar3,off
SetTimer,CheckInactiveWar3,Off
DllCall("ClipCursor", UInt, 0)
}
return

CheckActiveWar3:
	hWnd := WinActive("ahk_classWarcraft III")
	if hWnd
	{
		SetTimer,CheckActiveWar3,Off
		if GetWindowClientRect(hWnd,rect) && DllCall("ClipCursor","UInt",&rect)
		{
			_locked := 1
			SetTimer,CheckInactiveWar3
		}
		else
			SetTimer,CheckActiveWar3
	}
	Return

CheckInactiveWar3:
	IfWinNotActive,ahk_id%hWnd%
	{
		SetTimer,CheckInactiveWar3,Off
		if DllCall("ClipCursor")
		{
			_locked := 0
			SetTimer,CheckActiveWar3
		}
		else
			SetTimer,CheckInactiveWar3
	}
	Return

GetWindowClientRect(hWnd,ByRef rect)
{
	if !hWnd
		Return,0

	VarSetCapacity(cRect,16)
	if !DllCall("GetClientRect","UInt",hWnd,"UInt",&cRect)
		Return,0

	global cWidth := NumGet(cRect,8,"Int") - NumGet(cRect,0,"Int")
	global cHeight := NumGet(cRect,12,"Int") - NumGet(cRect,4,"Int")

	VarSetCapacity(rect,16)
	if !DllCall("GetWindowRect","UInt",hWnd,"UInt",&rect)
		Return,0

	wWidth := NumGet(rect,8,"Int") - NumGet(rect,0,"Int")
	margin := (wWidth - cWidth)//2

	NumPut(NumGet(rect,8,"Int") - margin,rect,8,"Int")
	NumPut(NumGet(rect,12,"Int") - margin,rect,12,"Int")
	NumPut(NumGet(rect,8,"Int") - cWidth,rect,0,"Int")
	NumPut(NumGet(rect,12,"Int") - cHeight,rect,4,"Int")

	global left := NumGet(rect,0,"Int")
	global top := NumGet(rect,4,"Int")

	Return,1
}