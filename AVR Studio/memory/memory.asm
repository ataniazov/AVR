;============================================================
			.include "m16def.inc"	; ATMega16
;= Start macro.inc ==========================================
; SUBI16    0x1234,R16,R17
.MACRO      SUBI16				; Start macro definition
		    SUBI    @1,low(@0) 	; Subtract low byte
		    SBCI    @2,high(@0)	; Subtract high byte
.ENDM				    		; End macro definition

; UOUT      UDR,R18
.MACRO      UOUT
    .if     @0 < 0x40
            OUT @0,@1
    .else
            STS @0,@1
    .endif
.ENDM
;= End macro.inc ============================================

; RAM =======================================================
			.DSEG					; RAM segment
            .ORG SRAM_START+100
Variables:  .byte   3
Variables2: .byte   1
; FLASH =====================================================
			.CSEG					; Code segment
Start:		NOP

            LDI     YL, low(Variables)
            LDI     YH, High(Variables)

            ;LDS     R16, Variables
            ;LDS     R17, Variables+1
            ;LDS     R18, Variables+2
            LD      R16, Y+
            LD      R17, Y+
            LD      R18, Y+

            SUBI    R16, (-1)
            SBCI    R17, (-1)
            SBCI    R18, (-1)

            ;STS     Variables,   R16
            ;STS     Variables+1, R17
            ;STS     Variables+2, R18
            ST      -Y, R18
            ST      -Y, R17
            ST      -Y, R16

			RJMP Start

; EEPROM ====================================================
			.ESEG					; EEPROM segment
;============================================================
