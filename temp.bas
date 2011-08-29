symbol RED = 0
symbol GREEN = 2
symbol BLUE = 4
symbol TEMP_PIN = 1
symbol T = b0

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