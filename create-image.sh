#!/bin/bash

sudo apt-get install -y docker.io repo

rm -rf share/
mkdir share

cd share/
echo 'cd /share' >> prepare.sh
echo 'repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b refs/tags/openstlinux-5.10-dunfell-mp1-21-03-31' >> prepare.sh
echo 'repo sync' >> prepare.sh
echo 'git clone https://github.com/Seeed-Studio/meta-st-odyssey.git' >> prepare.sh
chmod +x prepare.sh


echo 'cd /share' >> build.sh
echo 'DISTRO=openstlinux-weston MACHINE=stm32mp1 source layers/meta-st/scripts/envsetup.sh' >> build.sh
echo 'bitbake-layers add-layer ../meta-st-odyssey' >> build.sh
echo 'bitbake st-image-weston' >> build.sh
chmod +x build.sh
cd ../

chmod -R 777 share/

sudo docker build -t stm32mp1-dev .
