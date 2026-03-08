printJoinDisconnect() {
    static players := []
    static init := true
    if(init) {
        init := false
        Loop, % SAMP_PLAYER_MAX
        {

                players[A_Index-1].Push(getPlayerNameById(A_Index-1))
           
        }
        return
    }
    Loop, % SAMP_PLAYER_MAX
    {
        i := A_Index-1
        if (!IsNPCById(i))
        {
            name := getPlayerNameById(i)
            if (name != GetPlayerName())
            {

                if(name) {
                    if(name != players[i]) {
                        if(players[i]) {
                           AddChatMessage("{CEFF00}**** " players[i] " (Logout)")
                        }
                        players[i] := name
                        AddChatMessage("{CEFF00}**** " players[i] " (LOGIN)")
                    }
                }
                else {
                    if(players[i]) {
                        AddChatMessage("{CEFF00}**** " players[i] " (Logout)")
                        players[i] := ""
                    }
                }
            }
        }
        
    }
    Return
}
Return

join:
printJoinDisconnect()
Return
global joinmsg := 0

:?:/tog join::
Suspend, Permit

If (joinmsg = 1)
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (Betreten/Verlassen) ausgeschaltet.")
SetTimer, Join, OFF
joinmsg := 0
}
Else
{
AddChatMessage("{45B6FE}Info: {FFFFFF}Benachrichtigungen (Betreten/Verlassen) eingeschaltet.")
SetTimer, Join, 500
joinmsg := 1
}
Return

