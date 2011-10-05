
symbol TEMP_PIN = 1
symbol DO_THERMOMETER = pin3
symbol T = b0
symbol NEXT_READING = b1

' RGB 0, 2, 4 (count from right of binary)
symbol RED = %00010100
symbol YELLOW = %00010000
symbol GREEN = %00010001
symbol CYAN = %00000001
symbol BLUE = %00000101
symbol PURPLE = %00000100
symbol WHITE = %00000000

init:
	' mark pins 0, 2 and 4 as output
	let dirs = %0010101
	let NEXT_READING = 0
	
main:
	if DO_THERMOMETER = 1 then
		gosub thermometer
	else
		gosub nightlight
	endif
	nap 4 ' 228ms
	goto main

thermometer:
	if NEXT_READING > 0 then
		dec NEXT_READING
	else
		readtemp TEMP_PIN, T
		let NEXT_READING = 10
	endif 
	
	if T >= 27 then
		let pins = RED
	elseif T >= 24 then
		let pins = YELLOW
	elseif T >= 21 then
		let pins = GREEN
	elseif T >= 18 then

		let pins = CYAN
	elseif T >= 15 then

		let pins = BLUE
	elseif T >= 13 then
		let pins = PURPLE
	else
		let pins = WHITE
	endif
	return

nightlight:
	let pins = WHITE
	let NEXT_READING = 0
	return

' fix for gosub issue on MacAXEPad see
' http://www.picaxeforum.co.uk/archive/index.php/t-11785.html
interrupt: return