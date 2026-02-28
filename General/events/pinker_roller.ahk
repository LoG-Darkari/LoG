Global pr_gewinn := 0


:?:/prstart::
Suspend, Permit
AddChatMessage("{00BFFF}Wie hoch soll der Gewinn sein?")
fds_gewinn := PlayerInput("Gewinn: ")
AddChatMessage("{00BFFF}Wo startet das Event?")
start := PlayerInput("Start: ")
AddChatMessage("{00BFFF}Wo soll das Event enden?")
ziel := PlayerInput("Ziel: ")
if pr_gewinn is digit
{
    gewinn_formated := ThousandsSep(pr_gewinn)
}
Else
{
    AddChatMessage("Gewinn ungültig!")
    Return
}
SendChat("/echat +++ Der pinke Roller +++")
Sleep 5000
SendChat("/echat Es wird Zeit eure Rollerfahrskills unter Beweis zustellen, aber wie funktioniert das Event?")
Sleep 5000
SendChat("/echat Wir stellen euch einen pinken Roller mit vollem Tank bereit.")
Sleep 5000
SendChat("/echat Der Roller wartet hier auf euch:" start ")
Sleep 5000
SendChat("/echat Eure Aufgabe ist es mit dem Roller zum " ziel " zu fahren und ""Bin da"" in den Chat zu schreiben.")
Sleep 5000
SendChat("/echat Andere User die nicht auf dem Roller sitzen düfen euch herunterhauen oder den Weg blockieren.")
Sleep 5000
SendChat("/echat Waffen und Sonderfahrzeuge sind verboten.")
Sleep 5000
SendChat("/echat Derjenige der den Roller ans Ziel bringt bekommt $" gewinn_formated " als Gewinn!")
Sleep 500
SendInput, {F8}
Return


:?:/prstop::
Suspend, Permit 
AddChatMessage("{00BFFF}Wer ist der Gewinner?")
winner := PlayerInput("Gewinner: ")
if winner is digit
{
    winner := GetPlayerNameById(winner)
}
id := GetPlayerIdByName(winner)
if (winner != "" AND winner != GetPlayerName() AND id != "" AND !IsNPCById(id) AND pr_gewinn > 0)
{
SendChat("/echat Herzlichen Glückwunsch an " winner " !")
Sleep 500
cpu(winner, pr_gewinn, "Gewinn: Pinker Roller")
Sleep 5000
SendChat("/echat Und somit war es das mal wieder mit dem pinken Roller.")
Sleep 5000
SendChat("/echat Die News Reporter wüschen euch noch einen schöen Tag.")
Sleep 5000
SendChat("/echat +++ Der pinke Roller Ende +++")
Sleep, 500
SendInput, {F8}
pr_gewinn := 0
}
Else
{
    AddChatMessage("Fehler: Gewinner konnte nicht ermittelt werden")
}
Return