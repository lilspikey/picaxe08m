symbol BLINK_SPACE = 200

symbol EYE1 = b2
symbol EYE2 = b3
symbol EYE3 = b4
symbol CHOSEN_EYE = b5

init:
	' seed random number generator
	let w0 = 89
	let EYE1 = 1
	let EYE2 = 2
	let EYE3 = 4
	goto main

main:
	' turn on eyes
	high EYE1
	high EYE2
	high EYE3
	
	sleep 1 ' about 2.5 seconds
	random w0
	if b0 < 200 then
		goto main
	endif 

	
	gosub choose_eye
	let EYE1 = CHOSEN_EYE
	gosub choose_eye
	let EYE2 = CHOSEN_EYE
	gosub choose_eye
	let EYE3 = CHOSEN_EYE
	
	if EYE1 <> EYE2 and EYE2 <> EYE3 then
		' blink three eyes
		low EYE1
		pause BLINK_SPACE
		low EYE2
		pause BLINK_SPACE
		low EYE3
		pause BLINK_SPACE
		high EYE1
		pause BLINK_SPACE
		high EYE2
		pause BLINK_SPACE
	else if EYE1 <> EYE2 then
		' blink two eyes
		low EYE1
		pause BLINK_SPACE
		low EYE2
		pause BLINK_SPACE
		pause BLINK_SPACE
		high EYE1
		pause BLINK_SPACE
	else
		' blink one eye
		low EYE1
		pause BLINK_SPACE
		pause BLINK_SPACE
		pause BLINK_SPACE
	endif
	goto main
	end

choose_eye:
	random w0
	if b0 < 85 then
		let CHOSEN_EYE = 1
	elseif b0 < 170 then
		let CHOSEN_EYE = 2
	else
		let CHOSEN_EYE = 4
	endif
	return

' fix for gosub issue on MacAXEPad see
' http://www.picaxeforum.co.uk/archive/index.php/t-11785.html
interrupt: return
