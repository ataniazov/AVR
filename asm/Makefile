# Baud rate
BAUD       = 19200

# avrdude command and its options
AVRDUDE    = avrdude -C avrdude.conf -p m328p -c avrisp -P /dev/ttyACM0 -b $(BAUD) -v -e -D

COMPILE    = avra main.S -l main.lst

all:	
	$(COMPILE)

flash:	all
	$(AVRDUDE) -U flash:w:main.S.hex:i

clean:
	rm -f main.lst main.S.cof main.S.eep.hex main.S.hex main.S.obj
