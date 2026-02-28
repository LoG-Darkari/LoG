:?:/gstart::
Suspend, Permit
AddChatMessage("{00BFFF}Wie viele Personen nehmen an der Grußrunde teil? (1-2)")
anzahl := PlayerInput("Teilnehmer: ")
if(anzahl == 2) {
AddChatMessage("{00BFFF}Gib zuerst die 1. Handynummer und danach die 2. Handynummer des News Reporters ein.")
Nummer1 := PlayerInput("1. Handynummer: ")
if(Nummer1 != "" & Nummer1 is digit){
Nummer2 := PlayerInput("2. Handynummer: ")
if(Nummer2 != "" & Nummer2 is digit){
AddChatMessage("Benutze /gende zum Beenden der Grußrunde!")
SendChat("/echat +++ Grußrunde +++")
Sleep 5000
SendChat("/echat Nun habt Ihr wieder die Möglichkeit, eure Grüße loszuwerden.")
Sleep 5000
SendChat("/echat Sendet eure Grüße an die Nummern " Nummer1 " und " Nummer2 "")
Sleep, 500
SendInput, {F8}
Return
}
else  
AddChatMessage("Irgendwas ist da schief gegangen, versuchs nochmal.")
}
else  
AddChatMessage("Irgendwas ist da schief gegangen, versuchs nochmal.")
} 
else if(anzahl == 1) {
AddChatMessage("{00BFFF}Gib nun deine Handynummer  ein")
Nummer1 := PlayerInput("Handynummer: ")
if(Nummer1 != "" & Nummer1 is digit){
SendChat("/echat +++ Grußrunde +++")
Sleep 5000
SendChat("/echat Nun habt Ihr wieder die Möglichkeit, eure Grüßee loszuwerden.")
Sleep 5000
SendChat("/echat Sendet eure Grüße an die Nummer " Nummer1 "")
Sleep, 500
SendInput, {F8}
Return
}
else  
AddChatMessage("Irgendwas ist da schief gegangen, versuchs nochmal.")
Return
} else  
AddChatMessage("Irgendwas ist da schief gegangen, versuchs nochmal.")
Return

:?:/gstop::
Suspend, Permit
SendChat("/echat Entschuldigt bitte wenn wir euren Gruß nicht vorlesen konnten.")
Sleep 5000
SendChat("/echat Die News Reporter wünschen euch noch viel Spa� auf LoG")
Sleep 5000
SendChat("/echat +++ Grußrunde Ende +++")
Return