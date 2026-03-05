:?:/rlg::
Suspend, Permit
    Sleep, 500
    SendInput, t/q
    Sleep, 200
    SendInput {Enter}
    Sleep, 20000
    WinActivate, San Andreas Multiplayer 0.3.7
    Sleep, 2000
    SendInput, {ALT}
    Sleep, 500
    SendInput, S
    Sleep, 500
    SendInput C
    Sleep, 15000
    WinActivate, GTA:SA:MP
Return

:?:/drlg::
    Suspend, Permit
    Sleep, 500
    SendInput, t/q
    Sleep, 200
    SendInput {Enter}
    Sleep, 20000
    WinActivate, San Andreas Multiplayer 0.3.7
    Sleep, 2000
    SendInput, {ALT}
    Sleep, 500
    SendInput, S
    Sleep, 500
    SendInput C
    sleep 10000
    WinActivate, Device Selection
    sleep 2000
    SendInput {PgDn}
    sleep 100
    SendInput {Tab}
    sleep 100
    SendInput {End}
    sleep 100
    SendInput {Enter}
    Sleep, 15000
    WinActivate, GTA:SA:MP
Return


Login:
Suspend, Permit
GetChatLine(0, Chat)
if(instr(Chat, "Connected to Life of German "))
{
Sleep, 1000
   IniRead, pw, %ini%, Password, Password 
    if (pw = "" or pw = " " or pw = "ERROR")
    {
        AddChatMessage("{B22222} FEHLER: {FFFFFF} Passwort nicht gefunden!")
        Return
    }
    Else
    {
        AddChatMessage("{45B6FE}Info: {FFFFFF}Passwort gefunden! Versuche Auto-Login!")
    }
    Sleep, 10000
    SendRaw, %pw%
    Sleep, 1000
    SendInput, {Enter}
    Sleep, 15000
    SendInput, {ESC}
}


 
if(instr(Chat, "closed the connection") or instr(Chat, "You are banned from this server."))
{
    Sleep, 5000
    SendInput, t/q{enter}
    Sleep, 20000
    WinActivate, San Andreas Multiplayer 0.3.7
    Sleep, 10000
    SendInput, {ALT}
    Sleep, 1000
    SendInput, S
    Sleep, 1000
    SendInput C
    sleep 1000  
    WinActivate, Device Selection
    sleep 200
    SendInput {PgDn}
    sleep 100
    SendInput {Tab}
    sleep 100
    SendInput {End}
    sleep 100
    SendInput {Enter} 
    Sleep, 20000
    WinActivate, GTA:SA:MP
    Sleep, 40000

   IniRead, pw, %ini%, Password, Password 
    if (pw = "" or pw = " " or pw = "ERROR")
    {
        AddChatMessage("{B22222} FEHLER: {FFFFFF} Passwort nicht gefunden!")
         Return
    }
    Else
    {
        AddChatMessage("{45B6FE}Info: {FFFFFF}Passwort gefunden! Versuche Auto-Login!")
    }
    Sleep, 10000
    SendRaw, %pw%
    Sleep, 1000
    SendInput, {Enter}
    Sleep, 15000
    SendInput, {ESC}
    Sleep, 20000
}

