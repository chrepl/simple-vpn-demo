CC	= gcc
LD	= gcc

CFLAGS += -Ishrlib/tiny-AES-c
CFLAGS += -DAES256=1

ifdef AS_CLIENT
CFLAGS += -DAS_CLIENT=1
$(info AS_CLIENT defined)
endif

.EXPORT_ALL_VARIABLES:
AES256 = 1

default : vpn
.PHONY : default
.SILENT :

shrlib/tiny-AES-c/aes.a:
	$(MAKE) -C shrlib/tiny-AES-c lib

vpn : shrlib/tiny-AES-c/aes.a
	echo [CC] $@ $(CFLAGS)
	$(CC) $(CFLAGS) -o $@ vpn.c $<

clean :
	rm vpn
.PHONY :  clean