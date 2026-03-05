
:?:/tog::
Suspend, Permit
SendChat("/tog")
Sleep, 200
AddChatMessage("{45B6FE}Info: {FFFFFF}Togglebare Keybinder Funktionen: ")
AddChatMessage("{45B6FE}Info: {FFFFFF}[Join] Benachrichtigungen `(Betreten/Verlassen`) de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[Freunde] Benachrichtigungen der Freundesliste de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[Overlay] Overlay de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[Forum] RSS-Feed (Forum) de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[AFK] AFK-Timer de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[RSS] RSS-Feed de/aktivieren")
Return


:?:/tog join::
Suspend, Permit
ini = Settings.ini
IniRead, s, %ini%, Einstellungen, JoinMessages
If (s = 1)
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (Betreten/Verlassen) ausgeschaltet.")
IniWrite, 0, %ini%, Einstellungen, JoinMessages
SetTimer, Join, OFF
}
Else
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (Betreten/Verlassen) eingeschaltet.")
IniWrite, 1, %ini%, Einstellungen, JoinMessages
SetTimer, Join, 100
}
Return

:?:/tog freunde::
Suspend, Permit
ini = Settings.ini
IniRead, s, %ini%, Einstellungen, Freunde
If (s = 1)
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (Freunde) ausgeschaltet.")
IniWrite, 0, %ini%, Einstellungen, Freunde
SetTimer, Freunde, OFF
}
Else
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (Freunde) eingeschaltet.")
IniWrite, 1, %ini%, Einstellungen, Freunde
SetTimer, Freunde, 1000
}
Return

:?:/tog forum::
Suspend, Permit
ini = Settings.ini
IniRead, s, %ini%, Einstellungen, ForumFeed
If (s = 1)
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (Forum) ausgeschaltet.")
IniWrite, 0, %ini%, Einstellungen, ForumFeed
SetTimer, Forum, OFF
}
Else
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (Forum) eingeschaltet.")
IniWrite, 1, %ini%, Einstellungen, ForumFeed
Gosub, Forum
SetTimer, Forum, 1800000
}
Return


:?:/tog rss::
Suspend, Permit
ini = Settings.ini
IniRead, s, %ini%, Einstellungen, RssFeed
If (s = 1)
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (RSS) ausgeschaltet.")
IniWrite, 0, %ini%, Einstellungen, RssFeed
SetTimer, rss, OFF
}
Else
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (RSS) eingeschaltet.")
IniWrite, 1, %ini%, Einstellungen, RssFeed
Gosub, rss
SetTimer, rss, 1800000
}
Return



:?:/tog afk::
Suspend, Permit
if (afk_timer = 0)
{    
addChatMessage("{45B6FE}Info: {F59E42}AFK-Timer `(2o Minuten`) `{FFFFFF} wurde aktiveirt!")
SetTimer, AFKTIMER, 1200000
afk_timer := 1
Return
}
If (afk_timer != 0)
{  
AddChatMessage("{45B6FE}Info: {F59E42}AFK-Timer {FFFFFF} wurde deaktiviert!")
SetTimer, AFKTIMER, Off
afk_timer := 0
}
return

global p_overlay := 0

:?:/tog overlay::
Suspend, Permit
ini = Settings.ini
IniRead, s, %ini%, Einstellungen, Overlay
If (s = 1)
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Overlay ausgeschaltet.")
IniWrite, 0, %ini%, Einstellungen, Overlay
SetTimer, Overlay, OFF
p_overlay := 0
DestroyAllVisual()
}
Else
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Overlay eingeschaltet.")
IniWrite, 1, %ini%, Einstellungen, Overlay
SetTimer, Overlay, On
SetParam("use_window", "1")
SetParam("window", "GTA:SA:MP")
p_overlay := -1
Gosub, Overlay
}
Return