MansionMonsB1:
	db $0A
	IF DEF(_RED)
		db 43,KOFFING
		db 41,KOFFING
		db 42,GROWLITHE
		db 42,VULPIX
		db 41,DUOSION
		db 40,WEEZING
		db 44,PONYTA
		db 43,GRIMER
		db 38,MAGMAR
		db 42,MUK
	ENDC
	IF DEF(_BLUE)
		db 33,GRIMER
		db 31,GRIMER
		db 35,VULPIX
		db 32,PONYTA
		db 31,GRIMER
		db 40,MUK
		db 34,PONYTA
		db 35,KOFFING
		db 38,MAGMAR
		db 42,WEEZING
	ENDC
	db $00