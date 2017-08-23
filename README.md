ToorCon 19 TinyCylon Badge
==========================

This project is an adaptation of the [tinycylon project](https://www.dalewheat.com/products/) by [Dale Wheat](https://dalewheat.com). We only swapped 2 data pins and provided easy instructions on how to compile the new version for the toorcon 19 badge below.

Install Notes
-------------

On linux simply [download](https://www.arduino.cc/en/Main/Software) and install the latest arduino package:

```
$ cd ..
$ tar xvf arduino-1.8.4-linux64.tar.xz
$ cd arduino-1.8.4
$ ./install.sh
```

Then install the [MicroCore project](https://github.com/MCUdude/MicroCore) to add ATTiny13a support:

```
$ cd hardware
$ git clone https://github.com/MCUdude/MicroCore
```

Then try building the tinycylon project:

```
$ cd ../../tinycylon
$ make
```

It'll expect the arduino package to be installed in the parent directory ../arduino-1.8.4, if this isn't the case, change the AVRDIR setting in the Makefile:

```
AVRDIR = ../arduino-1.8.4/hardware/tools/avr
...
```

Programming the ATTiny
----------------------

Much of this is borrowed from the numerous tutorials on programming the [ATTiny13a with an Arduino as the ISP](https://www.linkedin.com/pulse/programming-attiny13a-using-arduino-isp-akash-deep), but we'll outline the basic idea in this section.

First you'll need to connect your Arduino to the ATTiny13a:

| Arduino | ATTiny13A |
| ------- | --------- |
| `5V`    | `VCC`     |
| `GND`   | `GND`     |
| `13`    | `PB2`     |
| `12`    | `PB1`     |
| `11`    | `PB0`     |
| `10`    | `PB5`     |


Then program your Arduino to act as an ISP by running the `arduino` gui and selecting `File` -> `Examples` -> `11.ArduinoISP` -> `ArduinoISP`. Then double check `Board`, `Port`, and `Programmer` settings and then `Upload` to the Arduino.

Once that's completed, you can use your Arduino to program the ATTiny13a by simply running:

```
$ make prog
```

Bug tracker
-----------

Have a bug? Please create an issue here on GitHub!

https://github.com/toorcon/tinycylon/issues

Copyright
---------

Original project copyright [Dale Wheat](https://dalewheat.com). Modifications copyright 2017 ToorCon.

Licensed under the BSD 3-Clause License: https://opensource.org/licenses/BSD-3-Clause
