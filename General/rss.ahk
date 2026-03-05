Forum:
IfWinNotActive, GTA:SA:MP
return
IniRead, RSS, %ini%, RSS-Link, RSS
Forum := RSSDownloadToString(RSS)
Loop, parse, Forum, `n, `r
{
    If (InStr(A_LoopField, "<title><![CDATA[") && !InStr(A_LoopField, "Forum - Life of German - Die Freizeitfabrik"))
    {
    RegExMatch(A_LoopField, "<title><!\[CDATA\[(.*)\]\]></title>", themetitle)
    }
    If (InStr(A_LoopField, "<dc:creator><![CDATA"))
    {
    RegExMatch(A_LoopField, "<dc:creator><!\[CDATA\[(.*)\]\]></dc:creator>", themecreator)

        If (themecreator1 != "" && themetitle1 != "" )
        {
        AddChatMessage("{45B6FE}[Forum] {FFFFFF}Neuer Beitrag von {45B6FE}" themecreator1 " {FFFFFF}im Thema {45B6FE}" themetitle1)
        }
    }
}
return

rss:
IfWinNotActive, GTA:SA:MP
return
IniRead, RSS, %ini%, RSS-Link, RSS2
Forum := RSSDownloadToString(RSS)
Loop, parse, Forum, `n, `r
{
    If (InStr(A_LoopField, "<title><![CDATA[") && !InStr(A_LoopField, "Forum - Life of German - Die Freizeitfabrik"))
    {
    RegExMatch(A_LoopField, "<title><!\[CDATA\[(.*)\]\]></title>", themetitle)
    }
    If (InStr(A_LoopField, "<dc:creator><![CDATA"))
    {
    RegExMatch(A_LoopField, "<dc:creator><!\[CDATA\[(.*)\]\]></dc:creator>", themecreator)

        If (themecreator1 != "" && themetitle1 != "" )
        {
        AddChatMessage("{45B6FE}[Lexikon] {FFFFFF}Neuer Beitrag von {45B6FE}" themecreator1 " {FFFFFF}im Thema {45B6FE}" themetitle1)
        }
    }
}
return

RSSDownloadToString(url, encoding = "utf-8")
{
static a := "AutoHotkey/" A_AhkVersion
if (!DllCall("LoadLibrary", "str", "wininet") || !(h := DllCall("wininet\InternetOpen", "str", a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr")))
return 0
c := s := 0, o := ""
if (f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr"))
{
while (DllCall("wininet\InternetQueryDataAvailable", "ptr", f, "uint*", s, "uint", 0, "ptr", 0) && s > 0)
{
VarSetCapacity(b, s, 0)
DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b, "uint", s, "uint*", r)
o .= StrGet(&b, r >> (encoding = "utf-16" || encoding = "cp1200"), encoding)
}
DllCall("wininet\InternetCloseHandle", "ptr", f)
}
DllCall("wininet\InternetCloseHandle", "ptr", h)
return o
}