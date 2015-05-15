#BUILDS=atmega8_snesmote atmega168
BUILDS=atmega168

all: $(addsuffix .hex,$(BUILDS))

%.hex: *.c *.h
	@[ -d objs-$*_extenmote ] || mkdir -p objs-$*_extenmote
	$(MAKE) -f Makefile.$*

clean:
	rm *.hex objs-*/*.o *.elf
