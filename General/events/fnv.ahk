Global fnv_gewinn := 0

:?:/fnvstart::
Suspend, Permit
AddChatMessage("{00BFFF}Wie hoch soll der Gewinn sein?")
fnv_gewinn := PlayerInput("Gewinn: ")
AddChatMessage("{00BFFF}Wo soll gesucht werden")
location := PlayerInput("Location: ")
SendChat("/stats")
sleep 150
nr := GetDialogLine(16)
nr := SubStr(nr, 33)
sleep 50
SendInput, {enter}
;AddChatMessage("{00BFFF}Wie lautet deine Handynummer?")
;nr := PlayerInput("Handynummer: ")
if fnv_gewinn is digit
{
gewinn_formated := ThousandsSep(fnv_gewinn)
}
Else
{
    AddChatMessage("Gewinn ungültig!")
    Return
}
SendChat("/echat +++ Finde den News Van +++")
Sleep 5000
SendChat("/echat Zeit für etwas Verstecken spielen.")
Sleep 5000
SendChat("/echat Wir haben irgendwo in " location " einen News Van verloren.")
Sleep 5000
SendChat("/echat Wenn ihr ihn gefunden habt sendet uns bitte den Standort und die Fahrzeug ID per SMS an die " nr "!")
Sleep 5000
SendChat("/echat Wir werden alle paar Minuten Tipps zum Standort des Vans geben.")
Sleep 5000
SendChat("/echat Der Finder bekommt eine Belohnung i.H.v. $" gewinn_formated "!")
Sleep, 500
SendInput, {F8}
return




:?:/fnvstop::
Suspend, Permit 
AddChatMessage("{00BFFF}Wer ist der Gewinner?")
winner := PlayerInput("Gewinner: ")
if winner is digit
{
    winner := GetPlayerNameById(winner)
}
id := GetPlayerIdByName(winner)
if (winner != "" AND winner != GetPlayerName()  AND id != "" AND !IsNPCById(id) AND fnv_gewinn > 0)
{
SendChat("/echat Herzlichen Glückwunsch an " winner " !")
Sleep 500
SendChat("/eu "winner " " fnv_gewinn " Gewinn: Finde den News Van")
Sleep 5000
SendChat("/echat Und somit war es das mal wieder mit Finde den News Van.")
Sleep 5000
SendChat("/echat Die News Reporter wünschen euch noch einen schönen Tag.")
Sleep 5000
SendChat("/echat +++ Finde den News Van Ende +++")
Sleep, 500
SendInput, {F8}
fnv_gewinn := 0
}
Else
{
    AddChatMessage("Fehler: Gewinner konnte nicht ermittelt werden")
}
Return