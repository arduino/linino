#!/bin/bash
set -e
PKG_BUILD_DIR="$1"

# SIP uses PyLong_FromUnsignedLong to convert from void * to
# PyLong. This results in a compilation error for the implicit cast
# on C++ compilers. Make an explicit cast.
sed -i -e 's/PyLong_FromUnsignedLong(/PyLong_FromUnsignedLong((unsigned long)/g' $PKG_BUILD_DIR/QtCore/sipQtCoreQThread.cpp

