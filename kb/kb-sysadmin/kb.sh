#!/bin/bash

kb.linux.sysadmin.adduser() {
cat<<'EOM'
==================================================
 USER MANAGEMENT & SUDO ACCESS
==================================================

[RHEL / CentOS / Fedora]
1. Add user:      useradd -m <username>
2. Set password:  passwd <username>
3. Grant sudo:    usermod -aG wheel <username>

[Debian / Ubuntu]
1. Add user:      adduser <username> (Interactive, sets up everything)
   Alternatively: useradd -m -s /bin/bash <username>
2. Grant sudo:    usermod -aG sudo <username>

[General]
- Check groups:   groups <username>
- Lock account:   usermod -L <username>
- Delete user:    userdel -r <username> (-r removes home directory)
EOM
}

kb.linux.sysadmin.networking.wifi() {
cat<<'EOM'
==================================================
 WIFI CONFIGURATION
==================================================

[proxmox/debian]
wpa_supplicant -B -i wlp14s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
ifup wlp14s0

[Modern Linux (NetworkManager - RHEL/Ubuntu)]
1. Scan for networks: nmcli dev wifi list
2. Connect:           nmcli dev wifi connect <SSID> password <PASSWORD>
3. Show connections:  nmcli connection show

[wpa_supplicant (Manual/Headless way)]
1. Generate config:   wpa_passphrase "SSID" "PASSWORD" > /etc/wpa_supplicant/wpa_supplicant.conf
2. Connect:           wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
3. Get IP (DHCP):     dhclient wlan0

[Troubleshooting]
- Unblock wifi:       rfkill unblock wifi
- Check status:       rfkill list
EOM
}

kb.linux.sysadmin.networking.static_ip() {
cat<<'EOM'
==================================================
 NETWORKING (STATIC IP, GATEWAY, ROUTING)
==================================================

[RHEL / CentOS / Fedora (NetworkManager)]
1. List connections:     nmcli con show
2. Set static IP & GW:   nmcli con modify "Wired connection 1" ipv4.addresses 192.168.1.50/24 ipv4.gateway 192.168.1.1 ipv4.dns "8.8.8.8 8.8.4.4" ipv4.method manual
3. Apply changes:        nmcli con up "Wired connection 1"
- Note: Use actual connection name from step 1 instead of "Wired connection 1".

[Ubuntu / Debian (Modern - Netplan)]
1. Find interface:       ip a
2. Edit config file:     nano /etc/netplan/01-netcfg.yaml (filename may vary)
3. Example YAML structure:
   network:
     version: 2
     renderer: networkd
     ethernets:
       eth0:
         addresses:
           - 192.168.1.50/24
         routes:
           - to: default
             via: 192.168.1.1
         nameservers:
           addresses: [8.8.8.8, 8.8.4.4]
4. Test safely:          netplan try (Reverts in 120s if you get disconnected)
5. Apply permanently:    netplan apply

[Debian (Legacy - /etc/network/interfaces)]
1. Edit file:            nano /etc/network/interfaces
   # Add/Modify the following:
   iface eth0 inet static
       address 192.168.1.50
       netmask 255.255.255.0
       gateway 192.168.1.1
2. Restart service:      systemctl restart networking

[General IP & Routing Commands (Temporary/On-the-fly)]
- Show interfaces/IPs:   ip a
- Show Routing Table:    ip r
- Add Default Route:     ip route add default via 192.168.1.1 dev eth0
- Delete Route:          ip route del default via 192.168.1.1
- Add Temp IP:           ip addr add 192.168.1.50/24 dev eth0
EOM
}

kb.linux.sysadmin.networking.firewall() {
cat<<'EOM'
==================================================
 FIREWALL MANAGEMENT
==================================================

[RHEL / CentOS (firewalld)]
1. Start/Enable:   systemctl enable --now firewalld
2. Allow Port:     firewall-cmd --permanent --add-port=80/tcp
3. Allow Service:  firewall-cmd --permanent --add-service=http
4. Apply Changes:  firewall-cmd --reload
5. List Rules:     firewall-cmd --list-all

[Debian / Ubuntu (UFW)]
1. Enable UFW:     ufw enable
2. Allow Port:     ufw allow 80/tcp
3. Allow Service:  ufw allow http
4. Deny IP:        ufw deny from 192.168.1.100
5. Status/Rules:   ufw status verbose
EOM
}

kb.linux.sysadmin.package() {
cat<<'EOM'
==================================================
 PACKAGE MANAGEMENT
==================================================

[RHEL / CentOS / Fedora (dnf/yum)]
- Update all:      dnf upgrade
- Install:         dnf install <package>
- Search:          dnf search <keyword>
- List installed:  dnf list installed | grep <package>
- Clean cache:     dnf clean all

[Debian / Ubuntu (apt)]
- Update repos:    apt update
- Upgrade all:     apt upgrade
- Install:         apt install <package>
- Search:          apt search <keyword>
- List installed:  dpkg -l | grep <package>
- Clean cache:     apt autoremove && apt clean
EOM
}

kb.linux.sysadmin.disk() {
cat<<'EOM'
==================================================
 DISK & STORAGE MANAGEMENT
==================================================

[Basic Commands]
- List block devs: lsblk
- Check usage:     df -h
- Check dir size:  du -sh /path/to/dir
- Get UUIDs:       blkid

[Mounting]
- Mount disk:      mount /dev/sdb1 /mnt/data
- Unmount:         umount /mnt/data
- Mount all fstab: mount -a
- Edit fstab:      nano /etc/fstab (Format: UUID=<uuid> /mnt/data ext4 defaults 0 2)

[LVM Basics]
1. Create PV:      pvcreate /dev/sdb
2. Create VG:      vgcreate data_vg /dev/sdb
3. Create LV:      lvcreate -L 10G -n data_lv data_vg
4. Format:         mkfs.ext4 /dev/data_vg/data_lv
EOM
}

kb.linux.sysadmin.services() {
cat<<'EOM'
==================================================
 SYSTEMD SERVICES & LOGS
==================================================

[systemctl]
- Start service:   systemctl start <service>
- Stop service:    systemctl stop <service>
- Restart:         systemctl restart <service>
- Start on boot:   systemctl enable <service>
- Disable on boot: systemctl disable <service>
- Check status:    systemctl status <service>
- Reload config:   systemctl daemon-reload

[journalctl (Logs)]
- View all logs:   journalctl
- Follow logs:     journalctl -f
- By service:      journalctl -u nginx.service
- Since time:      journalctl --since "1 hour ago"
- Boot logs:       journalctl -b (current boot), -b -1 (previous)
EOM
}


kb.win.sysadmin.services() {
cat<<'EOM'
==================================================
 WINDOWS SERVICES (INSTALL, DELETE, START, STOP)
==================================================

[PowerShell (Modern Approach)]
1. List services:     Get-Service | Where-Object {$_.Status -eq "Running"}
2. Start service:     Start-Service -Name "ServiceName"
3. Stop service:      Stop-Service -Name "ServiceName" -Force
4. Restart service:   Restart-Service -Name "ServiceName"
5. Install service:   New-Service -Name "ServiceName" -BinaryPathName "C:\path\app.exe" -Description "My App" -StartupType Automatic
6. Delete service:    Remove-Service -Name "ServiceName" 
   *(Note: Remove-Service requires PowerShell 6+. Use 'sc.exe' below for older versions)*

[Command Prompt / sc.exe (Universal & Bulletproof)]
1. Install/Create:    sc create "ServiceName" binPath= "C:\path\app.exe" start= auto
   *CRITICAL GOTCHA: You MUST put a space after the equals sign (e.g., binPath= "C:\...")!
2. Delete/Remove:     sc delete "ServiceName"
3. Start service:     sc start "ServiceName"   (Alternative: net start "ServiceName")
4. Stop service:      sc stop "ServiceName"    (Alternative: net stop "ServiceName")
5. Query status:      sc query "ServiceName"
6. Change config:     sc config "ServiceName" start= disabled

[Troubleshooting & Tips]
- Force kill a stuck service (stuck in "Stopping" state):
  1. Find the PID:    sc queryex "ServiceName"
  2. Kill the task:   taskkill /PID <PID> /F
EOM
}
