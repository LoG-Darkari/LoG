global t_winners := -1
global t_prizes := []

:?:/tstart::
Suspend, Permit
t_winners := -1
t_prizes := []
AddChatMessage("Wie viele Plätze gibt es zu belegen? (1 - 5)")
t_winners := PlayerInput("Anzahl der Gewinner: ")
location := PlayerInput("Veranstaltungsort: ")
t_begin := PlayerInput("Startzeit: ")
t_jury := PlayerInput("Beginn der Auswertung: ")
if t_winners is not digit
{
    AddChatMessage("Anzal der Gewinner muss eine Zahl sein!")
    Return
}
If (t_winners < 1 or t_winners > 5)
{
        AddChatMessage("Anzal der Gewinner muss zwischen 1 und 5 liegen!")
    Return
}
SendChat("/echat |_____| Tuningevent  |_____|")
Sleep, 5000
SendChat("/echat Zeit für die Tuningfreaks unter euch ihr Können unter Beweiß zu stellen.")
Sleep,5000
SendChat("/echat  Es wird hier stattfinden " location ".") 
Sleep, 5000
SendChat("/echat Ihr habt Zeit euch bis " t_begin " dort einzufinden.")
Sleep,5000
SendChat("/echat  Um " t_jury " werden wir mir der Auswertung der Autos beginnen.")
Sleep,5000
SendChat("/echat  Regeln: Kein DM - Es sind nur Privatfahrzeuge (PKW) erlaubt")
Sleep,5000
SendChat("/echat   Die besten " t_winners " Autos gewinnen folgendes:")
i := 1
While, i <= t_winners
{
     z :=PlayerInput("Gewinn Platz Nr " i " : ")
     if z is not digit
     {
         AddChatMessage("Du musst eine Zahl eingeben!")
         z :=PlayerInput("Gewinn Platz Nr " i " : ")
     }
     z_f := ThousandsSep(z)
    SendChat("/echat " i ". Platz : $" z_f )
    t_prizes.Push(z)
    i++
}
Sleep, 100
SendInput, {F8}
Return


:?:/tstop::
Suspend, Permit
if (t_winners = -1 or t_winners = 0)
{
    AddChatMessage("Benutze /tstart umd das Event zu starten!")
    Return
}
i := t_winners
While, i <= t_winners AND i != 0
{
     z :=PlayerInput("Gewinner Platz Nr " i " : ")
     if z is not digit
     {
         AddChatMessage("Du musst eine Zahl eingeben!")
         z :=PlayerInput("Gewinner Platz Nr " i " : ")
     }
    SendChat("/eu " z " " t_prizes[i] " Gewin Tuningevent")
    SendChat("/echat Der " i ". Platz geht an...")
    Sleep, 5000
    SendChat(getPlayerNamebyID(z) "! Herzlichen Glückwunsch.")
    i--
}

Sleep, 5000
SendChat("/echat Nun noch eine gute Heimfahrt und weiterhin viel Spaß auf LoG.")
Sleep, 5000
SendChat("/echat |_____| Tuningevent Ende |_____|")
Sleep, 100
SendInput, {F8} 
t_winners := -1
t_prizes := []

Return

