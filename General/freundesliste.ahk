;Code by Ryan
;Edit by Darkari



global friendStates := []
global fl_message := 1
SetTimer, Freunde, On

initFraks()
{
frak := {}
frak.Insert("FFFF00","San Andreas Logistik und Abschleppdienst")
frak.Insert("FFFFFF","Zivilist")
frak.Insert("B22222","OFFLINE")
frak.Insert("6495ED","Los Santos Police Department")
frak.Insert("1111FF","Federal Bureau of Investigation")
frak.Insert("33CC00","United States Army")
frak.Insert("660066","Front Yard Ballas")
frak.Insert("006600","Grove Street Families")
frak.Insert("666666","(Russen Mafia)")
frak.Insert("FFFF80","Triaden Mafia")
frak.Insert("795F37","Terroristen")
frak.Insert("00FFFF","(Support)")
frak.Insert("CC9966","San Andreas Abschlepp- un Pannendienst")
frak.Insert("FF3333","Los Santos Medical Department")
frak.Insert("009966","(EVENT)")
frak.Insert("993300","Hitman")
frak.Insert("CCDA6D","(Race)")
frak.Insert("FF9900","(Wanted)")
frak.Insert("FF1800","(GGB Team 1)")
frak.Insert("00CC00","(GGB Team 2)")
frak.Insert("DB7B9D","Yakuza Mafia") ;ZFF99CC
frak.Insert("FFD400","(Paintball)")
frak.Insert("FD824D","Bodyguard")
frak.Insert("FA58AC","(Das ist Pink)")
frak.Insert("27D67C","(Social Media)")
frak.Insert("0","(ERROR)")
Return frak
}
Return


:?:/fl::
Suspend, Permit
frak := initFraks()
string := ""
  Loop, read, freunde.txt 
    {
    Loop, parse, A_LoopReadLine, `n, `r 
    {
      name := A_LoopField
      id := getPlayerIdByName(name)
      if (id != -1) {
        color := GetPlayerColor(id)
        level := GetPlayerScoreById(ID)
        statusColor := "{00CD00}"
      }
      else {
        id := 9999
        level := 9999
        color := "B22222"
        statusColor := "{D4D4D4}"
      }    
       
            string := % string . "{" tcolor "}" id "`t{FFFFFF}" name "`t{" tcolor "}" frak[color] "`t" statusColor level "`n"
    }
  }
    Sort, string, N P9
  string := StrReplace(string, "9999", "---")
  string := "ID`tName`tFraktion`tLevel`n" . string
Sleep 300
showDialog(5, "Freundesliste", string, "Schließen")
return

:?:/fladd::
Suspend Permit
AddChatMessage("{45B6FE}Info: {FFFFFF}Gib einen Namen oder eine ID ein.")
name := PlayerInput("Name/ID: ")
if name is digit
  name := getPlayerNameById(name)
if (name == "") {
  AddChatMessage("{FF595E}FEHLER:{FFFFFF} Spielername darf nicht leer sein.")
  return
}
if (name == GetPlayerName())
{
  AddChatMessage("{FF595E} FEHLER: {FFFFFF} Du kannst nicht mit dir selbst befreundet sein.")
  return
}
If (GetPlayerIdbyName(name) = -1)
{
    AddChatMessage("{FF595E} FEHLER: {FFFFFF} Spieler konnte nicht gefunden werden.")
   return
}
If (IsNPCById(GetPlayerIDbyName(name)) = 1 )
{
    AddChatMessage("{FF595E} FEHLER: {FFFFFF} NPCs k�nnen nicht als Freund hinzugef�gt werden!")
   return
}
FileRead, Liste, Freunde.txt
If not InStr(Liste, name) 
{
 AddChatMessage("{45B6FE}Info: {FF4500}" name "{FFFFFF} wurde zur Freundesliste hinzugef�gt.")
FileAppend, %Name%`n, Freunde.txt
}
else 
{
AddChatMessage("{45B6FE}Info: {FF4500}"name "{FFFFFF} steht bereits auf der Freundesliste.")
}
return

:?:/fldel::
Suspend Permit
AddChatMessage("{45B6FE}Info: {FFFFFF}Gib einen Namen oder eine ID ein.")
name := PlayerInput("Name/ID: ")
if name is number
  name := getPlayerNameById(name)
if (name == "") {
  AddChatMessage("{FF595E} FEHLER: {FFFFFF}Diese ID gibt es nicht.")
  return
}
FileRead, Liste, Freunde.txt
If not InStr(Liste, name) 
{
 AddChatMessage("{45B6FE}Info: {FF4500}" name "{FFFFFF} steht nicht auf der Freundesliste.")
    return
}
else 
{    
      Loop, read, Freunde.txt
    {
     IfInString, A_Loopreadline, %name%
        continue 
         if(A_LoopReadLine!="")
        {
         FileAppend, %a_loopreadline%`n, Freundeneu.txt
     }
}
 FileDelete, Freunde.txt
 FileMove, Freundeneu.txt, Freunde.txt,
AddChatMessage("{45B6FE}Info: {FF4500}" name "{FFFFFF} wurde von der Freundesliste entfernt.")
}
return

:?:/flreset::
Suspend, Permit
FileDelete, Freunde.txt
AddChatMessage("{45B6FE}Info: {FFFFFF}Deine Freundesliste wurde geleert.")
return

Freunde:
if (!WinExist("GTA:SA:MP") || !GetPlayerId()) {
      friendStates := []
      return
    }
    if (!WinActive("GTA:SA:MP")) {
      return
    }
    fl_message := 1
If(fl_message == 1)
{
  Loop, read, Freunde.txt 
    {
    Loop, parse, A_LoopReadLine, `n, `r 
    {
      found := false
      name := A_LoopField
      for i, o in friendStates {
        if (i != name)
          continue
        id := getPlayerIdByName(name)
        if (id == -1 && friendStates[name] == "Online") {
          friendStates[name] := "Offline"
          AddChatMessage("{45B6FE}Info: {FFFFFF}Freund {FF4500}" name "{FFFFFF} ist nun{d71509} Offline{FFFFFF}.")
        }
        else if (id != -1 && friendStates[name] == "Offline") {
          friendStates[name] := "Online"
          AddChatMessage("{45B6FE}Info: {FFFFFF}Freund {FF4500}" name "{FFFFFF} ist nun{00CD00} Online{FFFFFF}.")
        }
        found := A_Index
        break
      }
      if (!found) {
          id := getPlayerIdByName(name)
        if (id == -1)
              friendStates[name] := "Offline"
        else 
          friendStates[name] := "Online"
      }
    }  
  }
}
else
{
}
return

