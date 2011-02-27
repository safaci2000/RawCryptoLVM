#!/bin/bash
sudo umount loopback
sudo vgchange -a n 
sudo cryptsetup luksClose cryptoLoop
sudo losetup -d /dev/loop0 
