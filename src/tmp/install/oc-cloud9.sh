#!/bin/bash
set -e
set -x

chmod a+rwx /tmp
curl -sSo /tmp/install/functions.sh https://raw.githubusercontent.com/joernott/docker-oc-install-library/master/install_functions.sh
source /tmp/install/functions.sh

install_software git glibc-static gcc make
create_user_and_group
git clone https://github.com/c9/core.git /cloud9
cd /cloud9
./scripts/install-sdk.sh
sed -e 's/127\.0\.0\.1/0.0.0.0/' -i /cloud9/configs/standalone.js
cleanup git make gcc cpp fipscheck fipscheck-lib glibc-devel glibc-headers groff-base kernel-headers less \
        libedit libgnome-keyring libgomp libmpc mpfr openssh openssh-clients perl-Carp perl-Encode perl-Error \
        perl-Exporter perl-File-Path perl-File-Temp perl-Filter perl-Getopt-Long perl-Git perl-HTTP-Tiny perl-PathTools \
        perl-Pod-Escapes perl-Pod-Perldoc perl-Pod-Simple perl-Pod-Usage perl-Scalar-List-Utils perl-Socket \
        perl-Storable perl-TermReadKey perl-Text-ParseWords perl-Time-HiRes perl-Time-Local perl-constant perl-libs \
        perl-macros perl-parent perl-podlators perl-threads perl-threads-shared rsync perl
        
