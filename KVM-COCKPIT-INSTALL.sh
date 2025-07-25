#-----------------------------------------------------------UPDATE-DNF-----------------------------------------------------------#
dnf -y update

#-----------------------------------------------------------INSTALL-COCKPIT-----------------------------------------------------------#
dnf install -y cockpit

#Enable the service to start on boot:#
systemctl enable --now cockpit.socket

#Allow the service through the firewall:#
firewall-cmd --permanent --zone=public --add-service=cockpit
firewall-cmd --reload
