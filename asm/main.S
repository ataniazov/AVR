          .device ATmega32
          .equ PORTB = 0x05     ;Port B
          .equ DDRB = 0x04      ;Data Direction Register Port B

          main:

             ldi r16,0x20         ;set port PB5 to output mode (pin5 is set for output, numbering starting at pin0)
             out DDRB,r16

             clr r17
          mainloop:
             eor r17,r16          ;invert output bit, eor=XOR operation
             out PORTB,r17        ;write to port
             call wait            ;wait some time
             rjmp mainloop        ;loop forever

          wait:
             ldi r20,0x10         ;loop 0x400000 times
             ldi r21,0x00         ;~12 million cycles
             ldi r22,0x00         ;~0.7s at 16Mhz
          w0:
             dec r22
             brne w0
             dec r21
             brne w0
             dec r20
             brne w0
             ret
