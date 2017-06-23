#!/bin/sh

flavor=${1:-server}
mountpoint=$2
arch=$3

if [ -n "$flavor" ] && [ -n "$mountpoint" ] && [ -n "$arch" ]  ; then
	echo "[TARBALL PREPARE]"

	mkdir source target
	sudo mount ${mountpoint} source

	sudo rsync -avP source/ target/

	sudo tar -jcvf virgil-ubuntu-${flavor}-${arch}-rootfs.tar.bz2 target/

	sudo umount source
	sudo rm -rf source target

	echo "[TARBALL DONE]"

else
	echo "Usage: ./ext2tar.sh <ubuntu-flavor> <ext4file> <arch>"
	exit 0
fi

