Route12Mons:
	db $0F
	;IF DEF(_RED)
		db 24,ODDISH
		db 25,SWABLU
		db 23,PIDGEY
		db 24,VENONAT
		db 22,BELLSPROUT
		db 26,VENONAT
		db 26,ODDISH
		db 27,PIDGEY
		db 28,WEEPINBELL
		db 30,GLOOM
	;ENDC
	;IF DEF(_BLUE)
	;	db 24,BELLSPROUT
	;	db 25,PIDGEY
	;	db 23,PIDGEY
	;	db 24,VENONAT
	;	db 22,BELLSPROUT
	;	db 26,VENONAT
	;	db 26,BELLSPROUT
	;	db 27,PIDGEY
	;	db 28,WEEPINBELL
	;	db 30,WEEPINBELL
	;ENDC
	;db $00
	db $03
	db 35,SLOWPOKE
	db 35,SLOWPOKE
	db 35,SLOWPOKE
	db 35,SLOWPOKE
	db 35,SLOWPOKE
	db 35,SLOWPOKE
	db 35,SLOWPOKE
	db 35,SLOWPOKE
	db 35,SLOWBRO
	db 40,SLOWBRO