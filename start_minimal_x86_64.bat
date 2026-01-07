qemu-img create -f qcow2 alpine_disk.qcow2 8G

qemu-system-x86_64.exe -accel tcg -m 128M -kernel .\boot\vmlinuz-virt -initrd .\boot\initramfs-virt -append "console=ttyS0 alpine_serial=ttyS0 alpine_dev=cdrom" -drive file=alpine-virt-3.23.2-x86_64.iso,media=cdrom -drive file=alpine_disk.qcow2,if=none,format=qcow2,id=hd0 -device virtio-blk-pci,drive=hd0 -nographic

setup-interface
setup-proxy
setup-apkrepos -f



qemu-system-x86_64.exe  -m 128M  -kernel .\boot\vmlinuz-virt  -initrd .\boot\initramfs-virt  -append "console=ttyS0 root=/dev/vda3 rootwait rw alpine_serial=ttyS0 rootfstype=ext4"  -drive file=alpine_disk.qcow2,if=none,format=qcow2,id=hd0 -device virtio-blk-pci,drive=hd0 -netdev user,id=n1,hostfwd=tcp::3128-:3128 -device virtio-net-pci,netdev=n1 -nographic

ip link set eth0 up
ip addr add 10.0.2.15/24 dev eth0
ip route add default via 10.0.2.2

@ for upstream proxy from inside of the shell commands not for squid upstream proxy
export http_proxy=http://192.168.4.5:8080
echo "nameserver 8.8.8.8" > /etc/resolv.conf
