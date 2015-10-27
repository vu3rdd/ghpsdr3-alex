#all:
#ifeq ($(CC),clang)
#	clang -std=gnu99 -g -O3 -Wall -o ../../bin/softrock -lpthread -lportaudio -lpulse-simple -lusb *.c
#else
#	gcc -std=gnu99 -g -O3 -Wall -o ../../bin/softrock -lpthread -lportaudio -lpulse-simple -lusb *.c
#endif



BUILT_SOURCES = firmware.h


bin_PROGRAMS = hpsdr-server



hpsdr_server_CFLAGS = -std=gnu99 -g -O3 -Wall @SIMD_FLAGS@

hpsdr_server_SOURCES = \
    bandscope.c  \
    listener.c \
    receiver.c \
    transmitter.c \
    util.c \
    client.c \
    ozy.c \
    ozyio.c \
    metis.c \
    server.c \
    bandscope.h \
    client.h \
    hpsdr_usb.h \
    messages.h \
    ozy.h \
    transmitter.h \
    util.h \
    buffer.h \
    getopt.h \
    listener.h \
    metis.h \
    ozyio.h \
    receiver.h \
    semaphore.h


nodist_hpsdr_server_SOURCES = firmware.h


dist_pkgdata_DATA = $(srcdir)/gen_firmware.sh

#
# firmware image
# has to be distributed in tarball but not installed
#
dist_check_DATA = $(srcdir)/ozyfw-sdr1k.hex

#
# Generate source file for firmware code
#
CLEANFILES = firmware.h

firmware.h: $(srcdir)/gen_firmware.sh $(dist_check_DATA)
	$(srcdir)/gen_firmware.sh $(srcdir)/$(dist_check_DATA) > $@


