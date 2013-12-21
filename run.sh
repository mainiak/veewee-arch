#!/bin/sh
#
# see:
# - http://cbednarski.com/articles/veewee/
# - https://github.com/jedi4ever/veewee/tree/master/templates/archlinux-x86_64
#
# gem install veewee
#
N="arch"
T="veewee-$N"
B="$N-base"
set -ex
if [ ! -d definitions/$T ]; then
  veewee vbox define $T archlinux-x86_64
fi
#OPT="-n" # NO GUI
veewee vbox build $OPT $T
veewee vbox export $T
BOX_FILE="./$T.box"
[ ! -f $BOX_FILE ] && exit 1
veewee vbox destroy $T
vagrant box add $B $BOX_FILE
