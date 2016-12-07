#!/bin/sh 
set -x

doas pkg_delete -I dwm dstat
find /usr/ports/packages -name dwm*  | xargs rm -f -

cd /usr/ports/x11/dwm
make clean
make distclean
make package

doas pkg_add -I -D unsigned /usr/ports/packages/amd64/all/dwm-6.1 dstat
