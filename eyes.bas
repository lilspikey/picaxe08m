symbol BLINK_SPACE = 200

symbol EYE1 = b2
symbol EYE2 = b3
symbol EYE3 = b4

init:
	' seed random number generator
	let w0 = 89
	let EYE1 = 1
	let EYE2 = 2
	let EYE3 = 4
main:
	' turn on eyes
	high EYE1
	high EYE2
	high EYE3
	'sleep 1
	nap 6 ' about a second
	'random w0
	'if w0 < 100 then
	'	goto main
	'endif 
	random w0
	if b0 < 100 then
		low EYE1
		pause BLINK_SPACE
		pause BLINK_SPACE
		pause BLINK_SPACE
	elseif b0 < 200 then
		low EYE1
		pause BLINK_SPACE
		low EYE2
		pause BLINK_SPACE
		pause BLINK_SPACE
		high EYE1
		pause BLINK_SPACE
	else
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
	endif
	goto main