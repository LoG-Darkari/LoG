global cpLoggedIn := 0
global pWHttp

createHTTPObject()
{    
pWHttp := ComObjCreate("WinHttp.WinHttpRequest.5.1")
pWHttp.SetTimeouts(6000,6000,6000,6000)
AddChatMessage("{45B6FE}Info: {FFFFFF}HTTP Object created")
Return
}

destroyHTTPObject()
{
ObjRelease(pWHttp)
AddChatMessage("{45B6FE}Info: {FFFFFF}HTTP Object destroyed")
Return
}

cp_login()
{
createHTTPObject()
user := GetPlayerName()
pw := "$"
pw := UrlEncode(pw)
RequestType 	:= "POST"
URL 			:= "https://samp.cp.life-of-german.org/login"
Payload 		:= "user=" user "&password=" pw "&login=Login"     	
response := cp_action(RequestType,URL,Payload)

if (instr(response, "Gespielte Stunden:"))
{
cpLoggedIN := 1
AddChatMessage("{45B6FE}Info: {FFFFFF}CP login sucessful")
}
Else
{
cpLoggedIN := 0 
AddChatMessage("{45B6FE}Info: {FFFFFF}CP login unsucessful")
}
Return  
}

cp_action(requestType, URL, Payload:="")
{
    	pWHttp.Open(RequestType, URL, 0)
	pWHttp.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    	if(StrLen(Payload) > 0)
		{
			AddChatMessage("{45B6FE}Info: {FFFFFF}Payload provided")
		pWHttp.Send(Payload)	
		}
	else
	{
		AddChatMessage("{45B6FE}Info: {FFFFFF}No payload provided")
		pWHttp.Send()
	}
	pWHttp.WaitForResponse()
     response := pWHttp.ResponseText()
Return response
}

cp_logout()
{
RequestType 	:= "GET"
URL 			:= "https://samp.cp.life-of-german.org/logout"
cp_action(RequestType, URL)
AddChatMessage("{45B6FE}Info: {FFFFFF}CP logout")
cpLoggedIN := 0 
destroyHTTPObject()
Return
}

UrlEncode( String )
{
	OldFormat := A_FormatInteger
	SetFormat, Integer, H

	Loop, Parse, String
	{
		if A_LoopField is alnum
		{
			Out .= A_LoopField
			continue
		}
		Hex := SubStr( Asc( A_LoopField ), 3 )
		Out .= "%" . ( StrLen( Hex ) = 1 ? "0" . Hex : Hex )
	}

	SetFormat, Integer, %OldFormat%

	Return Out
}
