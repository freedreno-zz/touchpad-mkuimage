#!/bin/sh

cd `dirname $0`

sudo make
novacom run "file:///bin/mount -o remount,rw /boot" && novacom put file:///boot/uImage.Fedora < uImage.Fedora && novacom run file:///bin/sync && novacom run file:///sbin/reboot
