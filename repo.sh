#!/bin/bash
OS="$(grep -i ^ID= /etc/os-release | cut -d= -f2)"
add()
{

echo -e  "[os]\nname=repo\nbaseurl=http://archive.kernel.org/centos-vault/7.9.2009/os/x86_64/\nenable=1\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7" >> centos.repo
echo -e  "[updates]\nname=update\nbaseurl=http://archive.kernel.org/centos-vault/7.9.2009/updates/x86_64/\nenable=1\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7" >> centos.repo
echo -e  "[extra]\nname=extra\nbaseurl=http://archive.kernel.org/centos-vault/7.9.2009/extras/x86_64/\nenable=1\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7" >> centos.repo 

}
if [ $EUID -ne 0  ];
then 
     echo "ERROR: you should run it as root !"
fi

if test -d /etc/yum.repos.d/ ;
then
     echo "you can run it , let's go!"
     cd /etc/yum.repos.d && mv * /home/$USER/
     add
else 
     echo "architect error !"
fi
     




