#!/bin/bash
mkdir loopback
sudo dd if=/dev/zero of=foobar.raw bs=1M count=2048
sudo losetup /dev/loop0 foobar.raw
sudo cryptsetup -y --cipher aes-cbc-essiv:sha256 --key-size 256 luksFormat /dev/loop0
sudo cryptsetup luksOpen /dev/loop0 cryptoLoop
sudo pvcreate /dev/mapper/cryptoLoop
sudo vgcreate cryptoLvmGrp /dev/mapper/cryptoLoop
sudo lvcreate -l100%VG -n lvmData cryptoLvmGrp
sudo mkfs  -t ext3 /dev/cryptoLvmGrp/lvmData
sudo mount /dev/cryptoLvmGrp/lvmData loopback
sudo chmod 777 loopback
