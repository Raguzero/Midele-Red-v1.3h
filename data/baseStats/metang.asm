db DEX_METANG ; pokedex id
db 60 ; base hp
db 75 ; base attack
db 100 ; base defense
db 50 ; base speed
db 55 ; base special
db STEEL ; species type 1
db PSYCHIC ; species type 2
db 3 ; catch rate
db 153 ; base exp yield
INCBIN "pic/bmon/metang.pic",0,1 ; 55, sprite dimensions
dw MetangPicFront
dw MetangPicBack
; attacks known at lvl 0
db TAKE_DOWN
db HEADBUTT
db CONFUSION
db 0
db 5 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10,15
	tmlearn 20
	tmlearn 26,29,31,32
	tmlearn 33,34,36,39
	tmlearn 44,47,48
	tmlearn 50,51,54,55
db BANK(MetangPicFront)
