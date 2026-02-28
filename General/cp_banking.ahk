cpu(recipient, amount, additional:="")
{ 
RequestType 	:= "POST"
URL 			:= "https://samp.cp.life-of-german.org/home/transfermoney"
Payload 		:= "payer=0&payee=0&payeeUser=" recipient "&money=" amount "&additionalText=" additional "&submit=%C3%9Cberweisen" 
	
    If (recipient = "")
{
    AddChatMessage("{B22222} FEHLER: {FFFFFF} Empfänger darf nicht leer sein!")
    Return -1
}
If recipient is digit 
{

   if (IsNPCById(recipient))
   {
       AddChatMessage("{B22222} FEHLER: {FFFFFF} Bots brauchen kein Geld!")
       Return -1
   }
   recipient := GetPlayerNameById(recipient)

}
if (Amount < 1 OR Amount  > 20000000)
{
    AddChatMessage("{B22222} FEHLER: {FFFFFF} Betrag muss min. $1 sein und max. $20.000.000")
    Return -1
}
if Amount is not digit
{
    AddChatMessage("{B22222} FEHLER: {FFFFFF} Betrag ungültig")
    Return -1
}
if (recipient = user)
{
    AddChatMessage("{B22222} FEHLER: {FFFFFF} Du kannst dir selbst nichts überweisen.")
    Return -1
}
if (cploggedin =0)
{
    cp_login()
}
If (recipient != "")
{
 response := cp_action(RequestType, URL, Payload)
 if (instr(response, "Die Transaktion konnte nicht verarbeitet werden,"))
 {
     AddChatMessage("{B22222} FEHLER: {FFFFFF} Transaktion konnte vom CP nicht verarbeitet werden.")
 }
cp_logout()
 Return
}
Return
}
