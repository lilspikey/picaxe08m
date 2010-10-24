symbol BLINK_SPACE = 200

symbol EYE1 = 1
symbol EYE2 = 2
symbol EYE3 = 4

init:
	' seed random number generator
	let w0 = 89
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