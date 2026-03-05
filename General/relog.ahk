/*
global SAMP_INFO_OFFSET                     := 0x21A0F8
global SAMP_PPOOLS_OFFSET                   := 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET             := 0x18
global SAMP_SLOCALPLAYERID_OFFSET           := 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET        := 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET       := 0xA
global SAMP_PREMOTEPLAYER_OFFSET            := 0x2E
global SAMP_ISTRLENNAME___OFFSET            := 0x1C
global SAMP_SZPLAYERNAME_OFFSET             := 0xC
global SAMP_PSZPLAYERNAME_OFFSET            := 0xC
global SAMP_ILOCALPLAYERPING_OFFSET         := 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET        := 0x2A
global SAMP_IPING_OFFSET                    := 0x28
global SAMP_ISCORE_OFFSET                   := 0x24
global SAMP_ISNPC_OFFSET                    := 0x4
*/
global SAMP_SZIP_OFFSET := 0x20

; returns server ip or empty string on error
getIP() {
    if(!checkHandles())
        return ""

    dwAddress := readDWORD(hGTA, dwSAMP +  SAMP_INFO_OFFSET[sampVersion])
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }

    ipAddr := readString(hGTA, dwAddress + SAMP_SZIP_OFFSET, 257)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }

    return ipAddr
}

; change server ip
setIP(IP) {
    if(!checkHandles())
        return False

    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion])
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return False
    }

    writeString(hGTA, dwAddress + SAMP_INFO_OFFSET[sampVersion], IP)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return False
    }

    return True
}



; returns server hostname or empty string on error
getHostname() {
    if(!checkHandles())
        return ""

    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion])
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }

    hostname := readString(hGTA, dwAddress + SAMP_SZHOSTNAME_OFFSET, 259)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }

    return hostname
}



; set nickname
setUsername(Username) {
    if(!checkHandles())
        return False

    dwAddress := dwSAMP + ADDR_SAMP_SERVERNAME[sampVersion]
    writeString(hGTA, dwAddress, Username)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return False
    }

    ErrorLevel := ERROR_OK
    return True
}

connect(IP) {
  setIP(IP)

  restartGameEx()
  disconnectEx()
  Sleep 1000
  setrestart()

  Return
}


restartGameEx() {
	
	if(!checkHandles())
		return -1
	
	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion])			;g_SAMP
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}
	
	dwFunc := dwSAMP + 0xA060
	
	VarSetCapacity(injectData, 11, 0) ;mov, call, retn
	
	NumPut(0xB9, injectData, 0, "UChar")	;mov ecx 	0+1
	NumPut(dwAddress, injectData, 1, "UInt")			;1+4
	NumPut(0xE8, injectData, 5, "UChar")	;call 		5+1
	offset := dwFunc - (pInjectFunc + 10)
	NumPut(offset, injectData, 6, "Int")	;			6+4
    NumPut(0xC3, injectData, 10, "UChar")	;		10+1
	
	writeRaw(hGTA, pInjectFunc, &injectData, 11)
	if(ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if(ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)

  closeProcess(hThread)

	return true
}

disconnectEx() {
	
	if(!checkHandles())
		return 0
	
	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion])			;g_SAMP
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	
	dwAddress := readDWORD(hGTA, dwAddress + 0x3c9)			;pRakClientInterface
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
    
    ecx := dwAddress        ;this
	
	dwAddress := readDWORD(hGTA, dwAddress)         ;vtable
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	
	
	
	VarSetCapacity(injectData, 24, 0) ;mov, call, retn
	
    NumPut(0xB9, injectData, 0, "UChar")	;mov ecx 	0+1
	NumPut(ecx, injectData, 1, "UInt")			;1+4
    
	NumPut(0xB8, injectData, 5, "UChar")	;mov eax 	5+1
	NumPut(dwAddress, injectData, 6, "UInt")			;6+4
	
    NumPut(0x006A006A, injectData, 10, "UInt")  ; 2x push			10+4
    
    NumPut(0x68, injectData, 10, "UChar")		;10 + 1		;push style
	NumPut(0, injectData, 11, "UInt")		;11 + 4
    
    NumPut(0x68, injectData, 15, "UChar")		;15 + 1		;push style
	NumPut(500, injectData, 16, "UInt")		;16 + 4
    
    ;---
	
	NumPut(0x50FF, injectData, 20, "UShort")			;20 + 2
	NumPut(0x08, injectData, 22, "UChar")			;22 + 1
	
	NumPut(0xC3, injectData, 23, "UChar")	;retn		23+1
	
	writeRaw(hGTA, pInjectFunc, &injectData, 24)
	if(ErrorLevel)
		return false
	
	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if(ErrorLevel)
		return false
	
	waitForSingleObject(hThread, 0xFFFFFFFF)

  closeProcess(hThread)

	return true
}

setrestart()
{
  VarSetCapacity(old, 4, 0)
  dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion])			;g_SAMP
    if(ErrorLevel || dwAddress==0) {
      ErrorLevel := ERROR_READ_MEMORY
      return 0
  }

  NumPut(9,old,0,"Int")
  writeRaw(hGTA, dwAddress + 957, &old, 4)
}

restart()
{
  restartGameEx()
  disconnectEx()
  AddChatMessage("{FFFFFF}Rejoining..")
  Sleep 1000
  setrestart()
  Return
}