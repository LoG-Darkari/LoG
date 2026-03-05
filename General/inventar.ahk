/*
/th -> to house
/tv -> to vehicle
/tp -> to player
/ta -> to appartment
/tf -> to fraction
/tb -> to post box


/fh -> from touse
/fv -> from vehicle
/fa -> from appartment
/ff -> from fraction
*/
:?:/iid::
Suspend, Permit
items := initItems()
AddChatMessage("Bitte gib eine Item-ID ein!")
;AddChatMessage(items.MaxIndex())
id := PlayerInput("Item ID: ")
If id is Not digit
{
    AddChatMessage("Ungültige Item-ID!")
    AddChatMessage("Min : " items.MinIndex() " - Max : " items.MaxIndex())
    Return
}
If (  id > items.MaxIndex() or id < items.MinIndex())
{
        AddChatMessage("Ungültige Item-ID!")
    AddChatMessage("Min : " items.MinIndex() " - Max : " items.MaxIndex())
    Return
}
Else
{
    AddChatMessage("Item-ID " id " : " items[id])
}
Return

:?:/inv::
Suspend, Permit
BlockInput, on
SendChat("/inventar")
sleep 100
SendInput, {Enter}
sleep 100
/*
y := GetDialogLines()
yz := []
for index, element in y
If (index > 4 && index < 15)
{
yz.Push(element) 
}
Sleep, 100
SendInput {Down}
SendInput {Enter}
Sleep 100
z := GetDialogLines()
SendInput, {Enter}
for index, element in z
If (index > 4 && index < 15)
{
yz.Push(element) 
}
AddChatMessage("Dein Inventar: ")
for index, element in yz
AddChatMessage("Slot - " element)
*/
BlockInput, off
Return

:?:/hinv::
Suspend, Permit
SendChat("/inventar haus")
sleep 100
SendInput, {Enter}
Return

:?:/vinv::
Suspend, Permit
SendChat("/inventar fahrzeug")
sleep 100
SendInput, {Enter}
Return

:?:/ainv::
Suspend, Permit
SendChat("/inventar appartment")
sleep 100
SendInput, {Enter}
Return

:?:/finv::
Suspend, Permit
SendChat("/inventar fraktion")
sleep 100
SendInput, {Enter}
Return

:?:/tossall::
Suspend, Permit
z := PlayerInput("Item ID: ")
tossItem(z)
Return

:?:/toss::
Suspend, Permit
z := PlayerInput("Item ID: ")
y := PlayerInput("Anzahl: ")
tossItem(z, y)
Return

:?:/tpall::
Suspend, Permit
z := PlayerInput("Item ID: ")
transferItemFromPlayerInventroy(z ,0)
Return

:?:/tp::
Suspend, Permit
z := PlayerInput("Item ID: ")
y := PlayerInput("Anzahl: ")
transferItemFromPlayerInventroy(z,0,y)
Return

:?:/mtpall::
Suspend, Permit
z := PlayerInput("Item ID: ")
x := PlayerInput("Spieler: ")
if x is not digit
x :=GetPlayerIdByName(x)
transferItemFromPlayerInventroy(z,0,,x)
Return

:?:/mtp::
Suspend, Permit
z := PlayerInput("Item ID: ")
y := PlayerInput("Anzahl: ")
x := PlayerInput("Spieler: ")
if x is not digit
x :=GetPlayerIdByName(x)
transferItemFromPlayerInventroy(z,0,y,x)
Return

:?:/tosslic::
Suspend, Permit
tossItem(1)
Sleep, 50
tossItem(2)
Sleep, 50
tossItem(3)
Sleep, 50
tossItem(6)
Sleep, 50
tossItem(147)
Sleep, 50
tossItem(148)
Sleep, 50
Return

:?:/tvall::
Suspend, Permit
z := PlayerInput("Item ID: ")
transferItemFromPlayerInventroy(z ,1)
Return

:?:/tv::
Suspend, Permit
z := PlayerInput("Item ID: ")
y := PlayerInput("Anzahl: ")
transferItemFromPlayerInventroy(z,1,y)
Return

:?:/thall::
Suspend, Permit
z := PlayerInput("Item ID: ")
transferItemFromPlayerInventroy(z ,2)
Return

:?:/th::
Suspend, Permit
z := PlayerInput("Item ID: ")
y := PlayerInput("Anzahl: ")
transferItemFromPlayerInventroy(z,2,y)
Return

:?:/tfall::
Suspend, Permit
z := PlayerInput("Item ID: ")
transferItemFromPlayerInventroy(z ,4)
Return

:?:/tf::
Suspend, Permit
z := PlayerInput("Item ID: ")
y := PlayerInput("Anzahl: ")
transferItemFromPlayerInventroy(z,4,y)
Return

:?:/taall::
Suspend, Permit
z := PlayerInput("Item ID: ")
transferItemFromPlayerInventroy(z ,5)
Return

:?:/ta::
Suspend, Permit
z := PlayerInput("Item ID: ")
y := PlayerInput("Anzahl: ")
transferItemFromPlayerInventroy(z,5,y)
Return