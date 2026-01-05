qemu-img create -f qcow2 alpine_disk.qcow2 8G

qemu-system-aarch64.exe  -M virt  -cpu cortex-a72  -m 1G  -kernel .\\boot\\vmlinuz-lts  -initrd .\\boot\\initramfs-lts  -append "console=ttyAMA0 alpine_serial=ttyAMA0 alpine_dev=cdrom"  -drive file=alpine-standard-3.23.2-aarch64.iso,media=cdrom  -drive file=alpine_disk.qcow2,if=none,format=qcow2,id=hd0  -device virtio-blk-device,drive=hd0  -nographic

qemu-system-aarch64.exe  -M virt,highmem=off  -cpu cortex-a72  -m 512M  -kernel .\boot\vmlinuz-lts  -initrd .\boot\initramfs-lts  -append "console=ttyAMA0 root=/dev/vda3 rw rootwait alpine_serial=ttyAMA0 rootfstype=ext4"  -drive file=alpine_disk.qcow2,if=none,format=qcow2,id=hd0  -device virtio-blk-device,drive=hd0  -nographic
