;============================================================
			.include "m16def.inc"	; ATMega16
;= Start macro.inc ==========================================
; SUBI16 0x1234,r16,r17
.MACRO SUBI16				; Start macro definition
		subi @1,low(@0) 	; Subtract low byte
		sbci @2,high(@0)	; Subtract high byte
.ENDM						; End macro definition
;= End macro.inc ============================================

.def counter = R0
.def temporary = R16
.undef temporary

.equ Time = 5
.equ Accelerate = 4
.equ Half_Speed = (Accelerate*Time)/2

; RAM =======================================================
			.DSEG					; RAM segment
var1:		.BYTE 1
table:		.BYTE 10
; FLASH =====================================================
			.CSEG					; Code segment
			NOP

Constant:	.db		10	; 0xAh hexadecimal
Message:	.db 	"Hello, World!"
Words:		.dw		10, 11, 12

label:		LDI		R16,'A'
			RJMP	label
; EEPROM ====================================================
			.ESEG					; EEPROM segment
;============================================================
