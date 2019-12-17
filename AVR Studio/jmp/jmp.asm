;============================================================
			.include "m16def.inc"	; ATMega16
;= Start macro.inc ==========================================
; SUBI16 0x1234,r16,r17
.MACRO SUBI16				; Start macro definition
		subi @1,low(@0) 	; Subtract low byte
		sbci @2,high(@0)	; Subtract high byte
.ENDM						; End macro definition
;= End macro.inc ============================================

; RAM =======================================================
			.DSEG					; RAM segment
; FLASH =====================================================
			.CSEG					; Code segment
			NOP

			.ORG 0x0010

M1:			NOP
			NOP
			LDI	ZL,low(M2)
			LDI ZH,High(M2)

			IJMP

			NOP
			NOP
			NOP
M2:			NOP

			RJMP PC+3
			NOP
			NOP
			RJMP M1
			NOP

			JMP 0x0000

; EEPROM ====================================================
			.ESEG					; EEPROM segment
;============================================================
