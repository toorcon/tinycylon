AVRDIR = ../arduino-1.8.4/hardware/tools/avr
AVRBIN = $(AVRDIR)/bin
CC = $(AVRBIN)/avr-gcc
SIZE = $(AVRBIN)/avr-size
OBJCOPY = $(AVRBIN)/avr-objcopy
AVRDUDE = $(AVRBIN)/avrdude
AVRDUDE_CONF = $(AVRDIR)/etc/avrdude.conf
AVRDUDE_PORT = /dev/ttyACM0
CFLAGS += -Os -mmcu=attiny13a
SOURCES = tinycylon.c
BIN = tinycylon.bin
HEX = tinycylon.hex

$(BIN):
	$(CC) -o $(BIN) $(SOURCES) $(CFLAGS) $(LDFLAGS)
	$(SIZE) -C $(BIN)
	$(OBJCOPY) -j .text -j .data -O ihex $(BIN) $(HEX)

clean:
	rm -f $(BIN) $(HEX)

prog:
	$(AVRDUDE) -C $(AVRDUDE_CONF) -v -pattiny13 -cstk500v1 -P$(AVRDUDE_PORT) -b 19200 -Uflash:w:$(HEX):i

