:?:/showall::
Suspend, Permit
closest := getClosestPlayerId()
if (closest = -1 or isNPC(closest))
{
    AddChatMessage("{FF595E} FEHLER: {FFFFFF}Spieler wurde nicht gefunden")
    Return
}
AddChatMessage("Du zeigst " GetPlayerNameById(closest) " deine Scheine / Inventar")
SendChat("/showperso " closest)
Sleep 1500
SendChat("/showlicenses " closest)
Sleep, 1000
SendChat("/inventar")
sleep 200
SendInput {ESC}
Sleep 100
SendRaw, %closest%
sleep 100
SendInput, {Enter}
sleep 5000
SendChat("/veh")
sleep 150
SendInput {Enter}
Sleep 200
SendChat("/inventar fahrzeug")
sleep 200
SendInput {ESC}
Sleep 100
SendRaw, %closest%
sleep 100
SendInput, {Enter}
sleep 500
SendChat("/veh")
sleep 150
SendInput {Enter}
return

:?:/sp::
Suspend, Permit
closest := getClosestPlayerId()
if (closest = -1 or isNPC(closest))
{
    Return
}
SendChat("/showperso " closest)
return

:?:/sl::
Suspend, Permit
closest := getClosestPlayerId()
if (closest = -1 or isNPC(closest))
{
    Return
}
SendChat("/showlicenses " closest)
return

:?:/taxi::
Suspend, Permit
Sleep, 300
SendChat("/service")
Sleep, 175
SendInput, {Enter}
return

:?:/sani::
Suspend, Permit
Sleep, 300
SendChat("/service")
Sleep, 175
SendInput, {Down 2}
Sleep, 100
SendInput, {Enter}
return

:?:/feuer::
Suspend, Permit
Sleep, 300
SendChat("/service")
Sleep, 175
SendInput, {Down 8}
Sleep, 100
SendInput, {Enter}
return

:?:/rlotto::
Suspend, Permit
random, lotto, 10, 80
SendInput /lotto %lotto%{enter}
return

:?:/kopfgeldalle::
Suspend, Permit
AddChatMessage("{00BFFF}Wie viel $ Kopfgeld soll auf alle Spieler gesetzt werden?")
summe := PlayerInput("Summe: ")
kopfgeld := true
username := getUsername()
Loop, 200
{
if (!kopfgeld)
break
name := getPlayerNameByID(A_Index)
if (name == "" || name == username || InStr(name, "[LoG]"))
continue
if (isNPCById(A_Index))
continue
farbe := getPlayerColor(A_Index)
if (farbe == "FFFFFF" || farbe == "CC9966" || farbe == "FF3333" || farbe == "FFFF00" || farbe == "009966" || farbe == "993300" || farbe == "795F37")
continue
if ((farbe == "33CC00" || farbe == "6495ED" || farbe == "0000FF") && summe < 500)
continue
SendChat("/kopfgeld " A_Index " " Summe)
sleep 300
}
kopfgeld := false
return

:?:/re::
Suspend, Permit
sleep 100
SendInput t/sms %L_Nummer%{Space}
return


global L_Nummer := 0

:?:/nsms::
Suspend Permit
AddChatMessage("{00BFFF}Wie lautet ein Teil bzw. der komplette Name?")
nam := PlayerInput("Name: ")
SendChat("/nummer " nam)
sleep 200
GetChatLine(0, Chat)
ifInString, Chat, Name:
{
ifInString, Chat, Nummer:
{
RegExMatch(Chat, "Name\:(.*)\| Nummer\:(.*)", NAME)
SendInput, {enter}
sleep 200
SendInput t/sms%NAME2%{space}
}
}
return

:?:/ncall::
Suspend Permit
AddChatMessage("{00BFFF}Wie lautet ein Teil bzw. der komplette Name?")
nam := PlayerInput("Name: ")
SendChat("/nummer " nam)
sleep 200
GetChatLine(0, Chat)
ifInString, Chat, Name:
{
ifInString, Chat, Nummer:
{
RegExMatch(Chat, "Name\:(.*)\| Nummer\:(.*)", NAME)
SendInput, {enter}
sleep 200
SendInput t/anrufen%NAME2%{enter}
}
}
Return


:?:/short::
Suspend Permit
Sleep 300
ShowDialog(0, "Kurzbefehle", "{00FF00}*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*`n{FF0000}/sp{00FFFF} ={ffffff} /showperso`n{FF0000}/sl{00FFFF} ={ffffff} /showlicenses`n{00FF00}*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*", "Schließen")
return
:?:/dienste::
Suspend Permit
Sleep 300
ShowDialog(0, "Service - Befehle", "{00FF00}*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*`n{FF0000}/tax{00FFFF} ={ffffff} Taxi rufen`n{FF0000}/sani{00FFFF} ={ffffff} Sanitäter rufen`n{FF0000}/feuer{00FFFF} ={ffffff} Feuer melden`n{FF0000}/saap{00FFFF} ={ffffff} SAAP rufen`n{00FF00}*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*", "Schließen")
return

:?:/ab::
Suspend Permit
FormatTime, std,, H
if(std>=0 && std<18)
uhrbeg := "Guten Tag"
if(std>=18 && std<25)
uhrbeg := "Guten Abend"
SendChat("/annehmen")
Sleep 1000
SendChat(uhrbeg ". Sie sind verbunden mit dem Anrufbeantworter von " getUsername() ".")
Sleep 1000
SendChat("Leider habe ich gerade keine Zeit, bitte versuchen Sie es später erneut.")
SendChat("/auflegen")
return

:?:/kit::
SendChat("/item 128 1")
return

SMS:
GetChatLine(0, Chat)
if(instr(Chat, "SMS von") && instr(Chat, "[ID:") && instr(Chat,"][") && instr (Chat, "]"))
{
RegExMatch(Chat, "\[\d*\]", SMS)
SMS := SubStr(SMS, 2)
StringTrimRight, SMS, SMS, 1
L_Nummer := SMS
}
return