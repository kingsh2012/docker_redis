#!/bin/bash
cat >> /etc/sysctl.conf <<EOF
vm.overcommit_memory=1
kernel.numa_balancing=0
vm.swappiness=1
net.core.somaxconn = 511
EOF
sysctl -p

cat >> /etc/rc.local <<EOF
echo 511 > /proc/sys/net/core/somaxconn
echo never > /sys/kernel/mm/transparent_hugepage/enabled
EOF
echo "重启系统rc.local生效"
