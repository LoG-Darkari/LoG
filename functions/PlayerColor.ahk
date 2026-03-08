global SAMP_COLOR_OFFSET                    := 0x216378 ;0x216380 ;0x216378  ;0x18F6C0 ;0x151828 ;0x216378 ;0x151578  [0x216378, 0x216380, 0x18F6C0, 0x151828]

PlayerColor(id)
{ 
getPColor(id)
}

getPlayerColorById(playerid)
{ 
getPColor(playerid)
}

getPColor(id)
{
    id += 0

    if(!checkHandles())
        return -1

    color := readDWORD(hGTA, dwSAMP + SAMP_COLOR_OFFSET + id*4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return color
}

colorToStr(color)
{
     color += 0
     color >>= 8
     color &= 0xffffff
     SetFormat, Integer, Hex
     color += 0
     color .= ""
     StringTrimLeft, color, color, 2
     l := StrLen(color)
        if (l == 4 )
        {
            color = 00%color% 
        }
        if (l == 2 )
        {
            color = 0000%color%  
        }
        SetFormat, IntegerFast, d
    return color
}