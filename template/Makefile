# Microcontroller. Example: atmega168
DEVICE     = atmega328p

# Clock frequency 16 MHz
CLOCK      = 16000000

# Baud rate
BAUD       = 19200

# avrdude command and its options
AVRDUDE    = avrdude -C avrdude.conf -p m328p -c avrisp -P /dev/ttyACM0 -b $(BAUD) -v -e -D

OBJECTS    = main.o

COMPILE    = avr-gcc -Wall -Os -DF_CPU=$(CLOCK) -mmcu=$(DEVICE)

all:	main.hex

.c.o:
	$(COMPILE) -c $< -o $@

.S.o:
	$(COMPILE) -x assembler-with-cpp -c $< -o $@

.c.s:
	$(COMPILE) -S $< -o $@

flash:	all
	$(AVRDUDE) -U flash:w:main.hex:i

clean:
	rm -f main.hex main.elf $(OBJECTS)

main.elf: $(OBJECTS)
	$(COMPILE) -o main.elf $(OBJECTS)

main.hex: main.elf
	rm -f main.hex
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex
	avr-size --format=avr --mcu=$(DEVICE) main.elf
