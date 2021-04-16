Func EQSend($message, $time)
	WinActivate("EverQuest")
	Send($message)
	Sleep($time)
EndFunc

$sections = IniReadSectionNames ( "config.ini" )

sleep(10000)
While 1
	$data = StringTrimRight(ClipGet(),1)
	If StringInStr($data, "@") Then
		For $i = 1 To $sections[0] Step 1
			If $data == $sections[$i] Then
				$commands = IniReadSection ( "config.ini", $sections[$i] )
				For $x = 1 to $commands[0][0]
					EQSend($commands[$x][0], $commands[$x][1])
				Next
			EndIf
		Next
		ClipPut("")
	EndIf
	Sleep(1000)
WEnd

#test Commit