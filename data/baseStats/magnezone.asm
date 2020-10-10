db DEX_MAGNEZONE ; pokedex id
db 70 ; base hp
db 70 ; base attack
db 115 ; base defense
db 60 ; base speed
db 130 ; base special
db ELECTRIC ; species type 1
db STEEL ; species type 2
db 30 ; catch rate
db 211 ; base exp yield
INCBIN "pic/bmon/magnezone.pic",0,1 ; 66, sprite dimensions
dw MagnezonePicFront
dw MagnezonePicBack
; attacks known at lvl 0
db TACKLE
db SONICBOOM
db THUNDERSHOCK
db 0
db 0 ; growth rate
; learnset
	tmlearn 6
	tmlearn 9,10,15
	tmlearn 20,24
	tmlearn 25,30,31,32
	tmlearn 33,34,39
	tmlearn 44,45,47
	tmlearn 49,50,55
db BANK(MagnezonePicFront)
