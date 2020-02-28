;Skydiving Pinball
;EEPROM:
;High score (name and score)
;price
;historical and resettable total coins
;
;each level is its own function
;
;use holtek for all inputs (keypad matrix). it will provide an interrupt
;which PICAXE can poll, saving much processing time.
#NO_DATA

;goto test
init:
hi2csetup I2CMASTER, %11100000, i2cfast, i2cbyte
pause 10
hi2cout (%00100001) ;driver on
pause 10
hi2cout (%10000001) ;display on, no blink
pause 10
hi2cout (%11100111) ;brightness

test:
serrxd b0
b0 = b0 DIG 0
gosub findDigit
hi2cout 0, (b0)
goto test

findDigit:
if b0 = 0 then
	b0 = %111111
	return
else if b0 = 1 then
	b0 = %110
	return
else if b0 = 2 then
	b0 = %1011011
	return
else if b0 = 3 then
	b0 = %1001111
	return
else if b0 = 4 then
	b0 = %1100110
	return
else if b0 = 5 then
	b0 = %1101101
	return
else if b0 = 6 then
	b0 = %1111101
	return
else if b0 = 7 then
	b0 = %0000111
	return
else if b0 = 8 then
	b0 = %1111111
	return
else if b0 = 9 then
	b0 = %1100111
	return
endif
serrxd ("ERROR")
goto test
		