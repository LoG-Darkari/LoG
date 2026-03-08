:?:/fysch::
Suspend, Permit
AddChatMessage("{45B6FE}Info: {FFFFFF}Keybinder - Fischen gestartet")
loop
{
    GetChatLine(0,line0)
    If (InStr(line0, "Du musst 2 Minuten warten, bis du wieder fischen kannst (Fischschutzbestimmungen)" Or "Du bist an keinem Angelplatz (Riesenrad am Beach) oder auf einem Boot!"))
    {
        AddChatMessage("{45B6FE}Info: {FFFFFF}Keybinder - Fischen beendet!")
        Break
    }
    SendChat("/fish")
    sleep 4025
}
return