;Code by Ryan
;Edit by Darkari



global friendStates := []
global fl_message := 1
SetTimer, Freunde, On

initFraks()
{
frak := {}
frak.Insert("ZFFFF00","SALA")
frak.Insert("ZFFFFFF","Zivilist")
frak.Insert("Z222222","")
frak.Insert("Z6495ED","SAPD")
frak.Insert("Z0000FF","FBI")
frak.Insert("Z33CC00","Army")
frak.Insert("Z660066","Ballas")
frak.Insert("Z006600","Grove")
frak.Insert("Z666666","(Russen)")
frak.Insert("ZFFFF80","Triaden")
frak.Insert("Z795F37","Terroristen")
frak.Insert("Z00FFFF","(Support)")
frak.Insert("ZCC9966","SAAP")
frak.Insert("ZFF3333","LSMD")
frak.Insert("Z009966","(EVENT)")
frak.Insert("Z993300","Hitman")
frak.Insert("ZCCDA6D","(Race)")
frak.Insert("ZFF9900","(Wanted)")
frak.Insert("ZFF1800","(GGB)")
frak.Insert("Z00CC00","(GGB)")
frak.Insert("ZFF99CC","Yakuza")
frak.Insert("ZFFD400","Paintball")
frak.Insert("ZFD824D","Bodyguard")
frak.Insert("ZFA58AC","Gaylord")
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
        ;color := colorToStr(color)
        color := "Z"+color
        ;AddChatMessage(color)
        level := GetPlayerScoreById(ID)
        statusColor := "{00CD00}"
      }
      else {
        id := 9999
        level := 9999
        color := "Z222222"
        statusColor := "{D4D4D4}"
      }    
       StringTrimLeft, tcolor, color, 1
       
            string := % string . "{" tcolor "}" id "`t{FFFFFF}" name "`t{" tcolor "}" frak[color] "`t" statusColor level "`n"
    }
  }
    Sort, string, N P9
  string := StrReplace(string, "9999", "---")
  string := "ID`tName`tFraktion`tLevel`n" . string
Sleep 300
showDialog(5, "Freundesliste", string, "Schließen")
return

:?:/fln::
Suspend, Permit
;frak := initFraks()
string := ""
  Loop, read, freunde.txt 
    {
    Loop, parse, A_LoopReadLine, `n, `r 
    {
      name := A_LoopField
      id := getPlayerIdByName(name)
      if (id != -1) {
        pc := GetPlayerColor(id)
        pcs := colorToStr(pc)
     ;AddChatMessage(pc)
        level := GetPlayerScoreById(ID)
        statusColor := "{00CD00}"
      }
      else {
        id := 9999
        level := 9999
        color := "Z222222"
        statusColor := "{D4D4D4}"
      }    
      
       
    string := % string . statusColor id "`t{FFFFFF}" name "`t" statusColor  level "`n"
    }
  }
    Sort, string, N P9
  string := StrReplace(string, "9999", "OFFLINE")
  string := "ID`tName`tLevel`n" . string
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
    IniRead, fl_message, %ini%, Einstellungen, Freunde
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

