#!/bin/bash
sudo umount loopback
sudo vgchange -a n  cryptoLvmGrp
sudo cryptsetup luksClose cryptoLoop
sudo losetup -d /dev/loop0 && rm -fr loopback/
