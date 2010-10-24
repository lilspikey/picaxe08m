symbol BLINK_SPACE = 200

init:
	' seed random number generator
	let w0 = 89
main:
	' turn on eyes
	high 1
	high 2
	high 4
	sleep 1
	if b0 > 200 then
		sleep 1
	endif
	random w0
	if b0 < 100 then
		low 1
		pause BLINK_SPACE
		pause BLINK_SPACE
		pause BLINK_SPACE
	elseif b0 < 200 then
		low 1
		pause BLINK_SPACE
		low 2
		pause BLINK_SPACE
		pause BLINK_SPACE
		high 1
		pause BLINK_SPACE
	else
		low 1
		pause BLINK_SPACE
		low 2
		pause BLINK_SPACE
		low 4
		pause BLINK_SPACE
		high 1
		pause BLINK_SPACE
		high 2
		pause BLINK_SPACE
	endif

	goto main