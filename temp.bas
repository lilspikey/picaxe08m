symbol RED = 0
symbol GREEN = 2
symbol BLUE = 4
symbol TEMP_PIN = 1
symbol T = b0

' TODO switching to setting all three color controlling pins at once
' using let pins = %00010101 (preceded by let dir = %0010101 to
' control which pins are actually outputs) That way should be easier to set
' symbols with names for colors.
' e.g. WHITE = %00000000, RED = %00010100
' Then re-order colors so white is coldest and red is hottest
' might make it easier to do animated transitions between colors or else have gradients
' using bit-banging/pwm

main:

	readtemp TEMP_PIN, T
	if T >= 27 then
		' WHITE
		low RED
		low GREEN
		low BLUE
	elseif T >= 24 then
		' RED
		low RED
		high GREEN
		high BLUE
	elseif T >= 21 then
		' YELLOW
		low RED
		low GREEN
		high BLUE
	elseif T >= 18 then
		' GREEN
		high RED
		low GREEN
		high BLUE
	elseif T >= 15 then
		' CYAN
		high RED
		low GREEN
		low BLUE
	elseif T >= 13 then
		' BLUE
		high RED
		high GREEN
		low BLUE
	else
		' PURPLE
		low RED
		high GREEN
		low BLUE
	endif
	pause 1000

	goto main