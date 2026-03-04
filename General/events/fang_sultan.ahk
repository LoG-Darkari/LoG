Global fds_gewinn := 0


:?:/fstart::
Suspend, Permit
AddChatMessage("{00BFFF}Wie hoch soll der Gewinn sein?")
fds_gewinn := PlayerInput("Gewinn: ")
AddChatMessage("{00BFFF}Wo findet das Event statt?")
location := PlayerInput("Location: ")
if fds_gewinn is digit
{
    gewinn_formated := ThousandsSep(fds_gewinn)
}
Else
{
    AddChatMessage("Gewinn ungültig!")
    Return
}
SendChat("/echat +++ Fang den News Sultan +++ ")
Sleep 5000
SendChat("/echat Wir spielen nun eine Runde Fang den News Sultan.")
Sleep 5000
SendChat("/echat Die Regeln lauten wie folgt:")
Sleep 5000
SendChat("/echat DM ist verboten und es dürfen auschließlich Autos verwendet werden.")
Sleep 5000
SendChat("/echat Wir werden mit einem gepanzerten Sultan durch " location " fahren.")
Sleep 5000
SendChat("/echat Ihr müsst versuchen uns bis zum Motorschaden zu rammen. Der Letzte der uns rammt hat gewonnen.")
Sleep 5000
SendChat("/echat Der Gewinner erhält $" gewinn_formated " als Preisgeld.")
Sleep 5000
SendChat("/echat Viel Spaߡ Wir drücken euch die Daumen.")
Sleep 500
SendInput, {F8}
Return


:?:/fstop::
Suspend, Permit 
AddChatMessage("{00BFFF}Wer ist der Gewinner?")
winner := PlayerInput("Gewinner: ")
if winner is digit
{
    winner := GetPlayerNameById(winner)
}
id := GetPlayerIdByName(winner)
if (winner != "" AND winner != GetPlayerName()  AND id != "" AND !IsNPCById(id) AND fds_gewinn > 0)
{
SendChat("/echat Herzlichen Glückwunsch an " winner " !")
Sleep 500
SendChat("/eu "winner," ", fds_gewinn, "Gewinn: Fang den News Sultan")
Sleep 5000
SendChat("/echat Und somit war es das mal wieder mit Fang den News Sultan.")
Sleep 5000
SendChat("/echat Die News Reporter wünschen euch noch viel Spaß!")
Sleep 5000
SendChat("/echat +++ Fang den News Sultan Ende +++")
fds_gewinn := 0
Sleep 500
SendInput, {F8}
}
Else
{
    AddChatMessage("Fehler: Gewinner konnte nicht ermittelt werden")
}
Return