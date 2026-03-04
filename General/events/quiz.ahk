global q_gewinn := -1
global q_runden := -1
global q_word := ""
global q_solution := ""
global q_counter := -1


:?:/qstart::
Suspend, Permit
AddChatMessage("{00BFFF}Wie hoch soll der Gewinn pro Frage sein?")
q_gewinn := PlayerInput("Gewinn: ")
AddChatMessage("{00BFFF}Wie viel Fragen willst du stellen?")
q_runden := PlayerInput("Runden: ")
If q_gewinn is not digit
{
    AddChatMessage("Gewinn ungültig")
    Return
}
if q_runden is not digit
{
    AddChatMessage("Anzahl der Fragen ist ungültig")
    Return
}
if (q_runden > 10 OR q_runden < 2 )
{
    AddChatMessage("Du kannst maximal 10 Fragen stellen und musst minimal 2 stellen.")
    Return
}
if (q_gewinn is digit AND q_gewinn <= 25000)
{
    gewinn_formated := ThousandsSep(q_gewinn)
}
Else
{
    AddChatMessage("Gewinn zu hoch!")
    Return
} 
SendChat("/stats")
sleep 175
nr := GetDialogLine(15)
nr := SubStr(nr, 33)
sleep 100
SendInput, {enter}
Sleep, 500
SendChat("/echat |___________| Quiztime |___________|")
Sleep 5000
SendChat("/echat  Guten Tag liebe User,  Zeit für etwas Denksport.")
Sleep 5000
SendChat("/echat   Wir veranstalten nun ein Quiz mit " q_runden " Fragen.")
Sleep 5000
SendChat("/echat  Für jede Frage gibt es " gewinn_formated " zu gewinnen.")
Sleep 5000
SendChat("/echat  Sendet eure Antwort bitte per SMS an die " nr ".")
Sleep 5000
SendChat("/echat Die erste richtige Antwort gewinnt.")
Sleep 5000
SendChat("/echat Und los gehts..")
q_counter := 0
Sleep 500
SendInput, {F8}
Return

:?:/qnext::
Suspend, Permit
AddChatMessage(q_counter)
if (q_counter == -1)
{
    AddChatMessage("Benutze /qstart um das Event zu starten!")
    Return
}
if (q_counter == 0)
{
    ++q_counter
    q_word := PlayerInput("Frage Nr " q_counter " : ")
    q_solution := PlayerInput("Lösung zu Frage Nr " q_counter " : ")
    SendChat("/echat Frage Nummer" q_counter " : " q_word)
    Return
}
if (q_counter < q_runden && q_counter > 0)
{
     ++q_counter
    AddChatMessage("{00BFFF}Wer ist der Gewinner?")
    winner := PlayerInput("Gewinner: ")
    if winner is digit
    {
        winner := GetPlayerNameById(winner)
    }
    id := GetPlayerIdByName(winner)
    if (winner != ""   AND winner != GetPlayerName()  AND id != "" AND !IsNPCById(id) AND q_gewinn > 0 ) 
    {
        SendChat("/echat Herzlichen Glücckwunsch an " winner "!")
        Sleep 500
        SendChat("/eu "winner, " ", q_gewinn, "Gewinn: Buchstabensalat")
        Sleep 5000
        SendChat("/echat Die Lösung war: " q_solution)
        q_word := PlayerInput("Frage Nr " q_counter " : ")
        q_solution := PlayerInput("Lösung zu Frage Nr " q_counter " : ")
        ;Sleep, 5000
        SendChat("/echat Frage Nummer" q_counter " : " q_word)
        Return
    }
}

if (q_counter = q_runden)
{
AddChatMessage("{00BFFF}Wer ist der Gewinner?")
winner := PlayerInput("Gewinner: ")
if winner is digit
{
    winner := GetPlayerNameById(winner)
}
id := GetPlayerIdByName(winner)
if (winner != ""  AND q_gewinn > 0 AND winner != GetPlayerName()  AND id != "" AND !IsNPCById(id) )
{
SendChat("/echat Herzlichen Glückwunsch an " winner "!")
Sleep 500
cpu(winner, q_gewinn, "Gewinn: Buchstabensalat")
Sleep 5000
SendChat("/echat Die Lösung war: " q_solution)
q_word := ""
q_counter := -1
q_solution := ""
q_runden := -1
Sleep 5000
SendChat("/echat So das war es erstmal mit dem Denksport. Wir hoffen ihr hattet Spaß!")
Sleep 5000
SendChat("/echat Noch weiterhin viel Spaߠauf LoG wünschen die News Reporter.")
Sleep 5000
SendChat("/echat |____________| Quiztime Ende  |____________| ")
Return
}
}
Return