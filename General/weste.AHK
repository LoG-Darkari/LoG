:?:/weste::
Suspend, Permit
x := GetPlayerArmor()
AddChatMessage("Weste: " +x)
if (x  = 0)
{
    SendChat("/item 144 4")
}   
if (x >0 && x <=25)
{
    SendChat("/item 144 3")
}   
if (x >25 && x <=50)
{
    SendChat("/item 144 2")
} 
if (x >50 && x <=75)
{
    SendChat("/item 144 1")
}
if (x = 100) 
{
    AddChatMessage("Deine Weste ist voll!")
}  
return