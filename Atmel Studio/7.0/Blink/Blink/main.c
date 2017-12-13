/*
* Blink.c
*
* Created: 12/12/2017
* Author : delta
*/

#define F_CPU 1000000UL
#define LED_PIN 5

#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
	/* Replace with your application code */
	DDRB |= (1 << LED_PIN);
	while (1)
	{
		PORTB ^= (1 << LED_PIN);
		_delay_ms(1000);
		_delay_ms(1000);
		_delay_ms(1000);
		_delay_ms(1000);
		_delay_ms(1000);
		_delay_ms(1000);
		_delay_ms(1000);
	}
}

