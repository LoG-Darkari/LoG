Logbackup:
FileCreateDir, %A_MyDocuments%\GTA San Andreas User Files\SAMP\Chatlogs
FormatTime, datum, %A_Now%, dd.MM.yyyy
FormatTime, zeit, %A_Now%, HH-mm-ss
FileCopy, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt, %A_MyDocuments%\GTA San Andreas User Files\SAMP\Chatlogs\Chatlog vom %datum% um %zeit% Uhr.txt, 0
return