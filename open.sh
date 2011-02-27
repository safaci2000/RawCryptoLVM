#!/bin/bash
sudo losetup /dev/loop0 foobar.raw
sudo cryptsetup luksOpen /dev/loop0 cryptoLoop
sudo pvcreate /dev/mapper/cryptoLoop
sudo vgcreate cryptoLvmGrp /dev/mapper/cryptoLoop
sudo lvcreate -l100%VG -n lvmData cryptoLvmGrp
sudo mkfs  -t ext3 /dev/cryptoLvmGrp/lvmData
sudo mount /dev/cryptoLvmGrp/lvmData ./loopback
