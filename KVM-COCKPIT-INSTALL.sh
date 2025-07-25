#-----------------------------------------------------------UPDATE-DNF-----------------------------------------------------------#
dnf -y update

#-----------------------------------------------------------INSTALL-KVM-----------------------------------------------------------#
dnf -y install @virt
#Check if Kernel modules are loaded#
lsmod | grep kvm 
#Install KVM Management tools#
dnf -y install virt-top libvirt-devel libguestfs-tools

#Start and enable KVM daemon#
systemctl start libvirtd
systemctl enable libvirtd

#Check if service is running !!DO NOT USE IN SCRIPT!!#
#systemctl status libvirtd

#Install Virtual machine manager#
dnf -y install virt-manager

#-----------------------------------------------------------INSTALL-COCKPIT-----------------------------------------------------------#
yum -y install cockpit
systemctl enable --now cockpit.socket
dnf install cockpit-machines.noarch

#Open the firewall#
firewall-cmd --permanent --zone=public --add-service=cockpit
firewall-cmd --reload
