global bst_gewinn := -1
global bst_runden := -1
global bst_word := ""
global bst_scrambled := ""
global bst_counter := -1
global running_event := -1


:?:/bststart::
Suspend, Permit
If (running_event != -1)
{
    AddChatMessage("{FF595E}FEHLER: {FFFFFF}Es ist gerade ein Event aktiv, deshalb kann kein weiteres Event gestartet werden!")
    Return

}
running_event := 1
AddChatMessage("{00BFFF}Wie hoch soll der Gewinn pro Wort sein?")
bst_gewinn := PlayerInput("Gewinn: ")
AddChatMessage("{00BFFF}Wie viel Runden willst du spielen?")
bst_runden := PlayerInput("Runden: ")
If bst_gewinn is not digit
{
    AddChatMessage("{FF595E}FEHLER: {FFFFFF}Gewinn ungültig")
    Return
}
if bst_runden is not digit
{
    AddChatMessage("{FF595E}FEHLER: {FFFFFF}Anzahl der Runden ist ungültig")
    Return
}
if (bst_runden > 10 OR bst_runden < 2 )
{
    AddChatMessage("{FF595E}FEHLER: {FFFFFF}Du kannst maximal 10 Runden und musst minimal 2 spielen.")
    Return
}
if (bst_gewinn is digit AND bst_gewinn <= 25000)
{
    gewinn_formated := ThousandsSep(bst_gewinn)
}
Else
{
    AddChatMessage("{FF595E}FEHLER: {FFFFFF}Gewinn zu hoch! Es sind maximal $25.000 pro wort Erlaubt!")
    Return
} 
SendChat("/stats")
sleep 175
nr := GetDialogLine(15)
nr := SubStr(nr, 33)
sleep 100
SendInput, {enter}
Sleep, 500
SendChat("/echat |___________| Buchstabensalat |___________|")
Sleep 5000
SendChat("/echat  Guten Tag liebe User,  Zeit für etwas Denksport.")
Sleep 5000
SendChat("/echat  Unser Mixer hat einige Wörter durcheinander geschmissen.")
Sleep 5000
SendChat("/echat  Ihr müsst sie wieder in die richtige Reihenfolge bringen und sie per SMS an die " nr " schicken.")
Sleep 5000
SendChat("/echat  Wir werden euch " bst_runden " gemixte Wörter vorgeben. ")
Sleep 5000
SendChat("/echat  Ihr bekommt pro Wort $" gewinn_formated " Gewinn.")
Sleep 5000
SendChat("/echat  Beispiel: daeLer = Leader")
bst_counter := 0
Sleep 500
SendInput, {F8}
Return

:?:/bstnext::
Suspend, Permit
AddChatMessage(bst_counter)
if (bst_counter == -1 or running_event == -1)
{
    AddChatMessage("{FACA0F}Warnung: {FFFFFF}Benutze /bststart um das Event zu starten!")
    Return
}
if (bst_counter == 0)
{
    ++bst_counter
    bst_word := PlayerInput("Wort Nr " bst_counter " :")
    bst_scrambled := scramble(bst_word)
    SendChat("/echat Wort Nummer" bst_counter " : " bst_scrambled)
    Return
}
if (bst_counter < bst_runden && bst_counter > 0)
{
     ++bst_counter
    AddChatMessage("{FACA0F}Warnung: {FFFFFF} Der Gewinn wird gleich vom Keybinder per CP Überwiesen. Sei vorsichtig!")
    AddChatMessage("{00BFFF}Wer ist der Gewinner?")
    winner := PlayerInput("Gewinner: ")
    if winner is digit
    {
        winner := GetPlayerNameById(winner)
    }
    id := GetPlayerIdByName(winner)
    if (winner != ""   AND winner != GetUsername() AND id != "" AND !IsNPCById(id) AND bst_gewinn > 0)
    {
        SendChat("/echat Herzlichen Glückwunsch an " winner " !")
        Sleep 500
        cpu(winner, bst_gewinn, "Gewinn: Buchstabensalat")
        Sleep 5000
        SendChat("/echat Die Lösung war: " bst_word)
        bst_word := PlayerInput("Wort Nr " bst_counter " :")
        bst_scrambled := scramble(bst_word)
        SendChat("/echat Wort Nummer" bst_counter " : " bst_scrambled)
        Return
    }
}

if (bst_counter = bst_runden)
{
    AddChatMessage("{FACA0F}Warnung: {FFFFFF} Der Gewinn wird gleich vom Keybinder per CP überwiesen. Sei vorsichtig!")
    AddChatMessage("{00BFFF}Wer ist der Gewinner?")
winner := PlayerInput("Gewinner: ")
if winner is digit
{
    winner := GetPlayerNameById(winner)
}
id := GetPlayerIdByName(winner)
if (winner != ""  AND bst_gewinn > 0 AND winner != GetUsername() AND id != "" AND !IsNPCById(id) )
{
SendChat("/echat Herzlichen Glückwunsch an " winner " !")
Sleep 500
cpu(winner, bst_gewinn, "Gewinn: Buchstabensalat")
Sleep 5000
SendChat("/echat Die Lösung war: " bst_word)
bst_word := ""
bst_scrambled := ""
bst_counter := -1
bst_runden := -1
Sleep 5000
SendChat("/echat So das war es erstmal mit dem Denksport. Wir hoffen ihr hattet Spaß!")
Sleep 5000
SendChat("/echat Noch weiterhin viel Spaߠauf LoG wünschen die News Reporter.")
Sleep 5000
SendChat("/echat |____________| Buchstabensalat Ende  |____________| ")
running_evnt := 0
Return
}
}
Return

:?:/bstedit::
Suspend, Permit
if (bst_counter == -1 or running_event == -1)
{
    AddChatMessage("{FACA0F}Warnung: {FFFFFF}Benutze /bststart um das Event zu starten!")
    Return
}
AddChatMessage("{00BFFF}Wie hoch soll der Gewinn pro sein?")
bst_gewinn := PlayerInput("Gewinn: ")
AddChatMessage("{00BFFF}Wie viel Runden willst du insgesamt spielen?")
bst_runden := PlayerInput("Runden: ")
AddChatMessage("{00BFFF}Wie viel Runden wurden schon gespielt?")
bst_counter := PlayerInput("Bereits gepielte Runden: ")
If bst_gewinn is not digit
{
    AddChatMessage("Gewinn ungültig")
    Return
}
if bst_runden is not digit
{
    AddChatMessage("Anzahl der Runden ist ungültig")
    Return
}
if (bst_runden > 10 OR bst_runden < 2 )
{
    AddChatMessage("Du kannst maximal 10 Runden und musst minimal 2 spielen.")
    Return
}if (bst_counter > 10 OR bst_counter < 0 )
{
    AddChatMessage("Du kannst maximal 9 Runden und musst minimal 0 bereits gespielt haben.")
    Return
}
Return