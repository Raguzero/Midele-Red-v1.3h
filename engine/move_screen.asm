MoveScreen:
	call LoadMonData
	call GBPalWhiteOut
	call ClearScreen
	
	; Count non-empty moves
	ld hl, wLoadedMonMoves
	ld b, 0
    ld c, NUM_MOVES
.countMoves
	ld a, [hli]
	and a
	jr z, .doneCount
	inc b
    dec c
	jr nz, .countMoves
.doneCount
	ld a, b
	and a
	ret z  ; Exit if no moves
	dec a
	ld [wMaxMenuItem], a
	
	; Draw border and format moves
	coord hl, 0, 0
	lb bc, 9, 18
	call TextBoxBorder
	
	ld bc, NUM_MOVES + 1
	ld hl, wMoves
	call FillMemory
	ld hl, wLoadedMonMoves
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	farcall FormatMovesString
	coord hl, 2, 2
	ld de, wMovesString
	call PlaceString
	
	; print the Pokemon's nickname
	ld hl, wPartyMonNicks
	ld a, [wWhichPokemon]
	call GetPartyMonName
	coord hl, 4, 0
	ld de, wcd6d
	call PlaceString
	
; Set up menu cursor position
	ld a, 2  ; Y position (row 2)
	ld [wTopMenuItemY], a
	ld a, 1  ; X position (column 0)
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	xor a
	ld [wMenuWrappingEnabled], a
		
	call GBPalNormal
	
.menuLoop
	call HandleMenuInput
	bit 1, a  ; B button
	ret nz
	
	; A pressed - show move info
    coord hl, 0, 11
    lb bc, 5, 18
    call TextBoxBorder

	ld a, [wCurrentMenuItem]
	ld hl, wLoadedMonMoves
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wMoveNum], a
	ld [wd11e], a
	farcall PrintMoveScreenDescription
	
; read move data into buffer
    ld a, [wMoveNum]
	dec a
	ld hl, Moves
	ld bc, MoveEnd - Moves
	call AddNTimes
	ld de, wBuffer
	ld a, BANK(Moves)
	call FarCopyData

	; move info labels
	coord hl, 1, 12
	ld de, MoveScreenInfoLabels
	call PlaceString
	; place the move's type
	coord hl, 1, 12
	predef PrintBufferedMoveType
	; place the move's power
	coord hl, 6, 13
	ld de, wBuffer + 2
	ld a, [de]
	cp 1
	jr z, .nullString
	and a
	jr z, .nullString
	jr .notZero1
.nullString
	ld de, NullMoveScreenInfoLabel
	call PlaceString
	jr .powerDone
.notZero1
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber
.powerDone
	; place the move's accuracy
	ld a, [wBuffer + 4]
	ld [wPlayerMoveAccuracy], a
	farcall ConvertPercentagesBattle
	ld de, wBuffer + 6
	coord hl, 15, 13
	lb bc, 1, 3
	call PrintNumber
.printPP
	ld a, [wBuffer + 5]
	ld de, wBuffer + 5
	coord hl, 14, 12
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber
	
	; move effect icons
	;call PrintMoveScreenEffectIcons

	jp .menuLoop
    ret
	
MoveScreenInfoLabels:
	db   "         PP:"
	feed "PWR:     ACC:    %"
	db "@"

NullMoveScreenInfoLabel:
	db "---@"
