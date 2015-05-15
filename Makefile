AVRDUDE_MCU		:= atmega168pb
AVRDUDE_CABLE	:= usbtiny
AVRDUDE_CONF	:= avrdude.conf

all: SW/atmega168_extenmote.hex
.PHONY: flash fuses firmware clean

SW/atmega168_extenmote.hex:
	$(MAKE) -C SW/

flash: SW/atmega168_extenmote.hex
	avrdude -p $(AVRDUDE_MCU) -c $(AVRDUDE_CABLE) -C $(AVRDUDE_CONF) -U flash:w:$<:i

fuses:
	# CKSEL3..1=111 (Crystal 8-16MHz, low power)
	# CKSEL0=1 (Crystal)
	# SUT1..0=01 (BOD enabled)
	avrdude -p $(AVRDUDE_MCU) -c $(AVRDUDE_CABLE) -C $(AVRDUDE_CONF) -U lfuse:w:0xDf:m -U hfuse:w:0xdd:m -U efuse:w:0x01:m

clean:
	rm -f *.o *.elf *.hex

