#!/bin/bash
mkdir loopback
sudo losetup /dev/loop0 foobar.raw
sudo cryptsetup luksOpen /dev/loop0 cryptoLoop
sudo vgscan 
sudo vgchange -a y cryptoLvmGrp
sudo mount /dev/cryptoLvmGrp/lvmData ./loopback
sudo chmod 777 loopback
