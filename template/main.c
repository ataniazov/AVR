//#define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN 5

void init(void);
void setup(void);
void loop(void);

int main(void) {

	init();

	setup();

	for (;;)
		loop();

	return 0;
}

void init() {
}

void setup() {
	DDRB |= 1 << LED_PIN;	
}

void loop() {
	PORTB |= 1 << LED_PIN;
	_delay_ms(1000);
	PORTB &= ~(1 << LED_PIN);
	_delay_ms(1000);
}
