#UIMAGE = ../../../kernel-touchpad/arm/arch/arm/boot/uImage
UIMAGE = uImage

uImage.Fedora: uRamdisk.Fedora uImage
	mkimage -A arm -O linux -T multi -a 0x40208000 -e 0x40208000 -C none -n "boot image" -d $(UIMAGE):uRamdisk.Fedora uImage.Fedora

uRamdisk.Fedora: ramdisk.fedora
	mkimage -A arm -O linux -T ramdisk -C none -d ramdisk.fedora uRamdisk.Fedora

ramdisk.fedora: rd/init
	(cd rd ; find . | cpio -H newc -o | gzip > ../ramdisk.fedora)

.PHONY clean:

clean:
	rm -f ramdisk.fedora uRamdisk.Fedora uImage.Fedora

