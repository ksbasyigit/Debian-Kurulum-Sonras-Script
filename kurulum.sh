# Debian 9 Güncelleme
apt update
apt upgrade
apt install net-tools -y

# Cockpit Kurulumu
echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
apt update
apt install cockpit -y
systemctl start cockpit
systemctl enable cockpit
# systemctl status cockpit

# Webmin Kurulumu
echo 'deb http://download.webmin.com/download/repository sarge contrib' > /etc/apt/sources.list.d/webmin.list
echo 'deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib' > /etc/apt/sources.list.d/webmin.list
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
apt update
apt install webmin -y
systemctl start webmin
systemctl enable webmin
# systemctl status webmin

# Vmware Open Tool Kurulumu
apt install open-vm-tools neofetch -y
# echo 'neofetch' > ./bashrc

# Veeam Backup Kurulumu
wget http://repository.veeam.com/backup/linux/agent/dpkg/debian/x86_64/pool/veeam/v/veeam-release-deb/veeam-release-deb_1.0.7_amd64.deb
# wget https://www.veeam.com/download_add_packs/backup-agent-linux/deb-64
# wget https://www.veeam.com/download_add_packs/backup-agent-linux/recovery-64
dpkg -i ./veeam-release* && apt update
apt install veeam cifs-utils -y

# IPv6 Disable
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
alias ll="ls -al"
dpkg-reconfigure console-setup
dpkg-reconfigure tzdata
