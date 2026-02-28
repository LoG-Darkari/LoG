:?:/nws::
Suspend, Permit
ini = Settings.ini
i = 1
AddChatMessage("{45B6FE}Info: {FFFFFF}News gestartet")
while i < 20
{
    z = Z
    z := z . i
IniRead, News, %ini%, News, %z%
if (News != "" AND news != "ERROR")
{ 
SendChat("/echat " News)
i++
Sleep, 5250
}
Else
{  
AddChatMessage("{45B6FE}Info: {FFFFFF}News beendet")
SendInput, F8
Break
}
}
Return