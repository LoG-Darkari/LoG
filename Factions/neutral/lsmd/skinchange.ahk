; Medic Skin 276
; Fire Skin 279
lsmd_skinchange()
{
c_skin := GetPlayerSkinId()
AddChatMessage(c_skin)
if (c_skin = 274 OR 275 OR 276)
{
 if (cpLoggedIN != 1)
 {
    cp_login()
 }
 cp_action("POST","https://samp.cp.life-of-german.org/ingameshop/skin/factionSkinID/279")
 cp_logout()
 Return
}
Return

if (cskin = 277 OR 278 or 279)
{
 if (cpLoggedIN != 1)
 {
    cp_login()
 }
 cp_action("POST","https://samp.cp.life-of-german.org/ingameshop/skin/factionSkinID/274")
 cp_logout()
 Return

}
Else
{
    AddChatMessage("{B22222}FEHLER: {FFFFFF} Du hast aktuell keinen LSMD Skin!")
    Return
}
Return
}