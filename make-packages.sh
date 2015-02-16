#!/bin/bash

VERSION=`grep -o "[0-9\\.]*" project/src/Version.h`

echo "Version: $VERSION"
echo ""

OUTDIR=miceamaze-$VERSION
echo "==== Making ${OUTDIR}.tar.gz ===="
rm -rf $OUTDIR ${OUTDIR}.tar.gz
make -C linux-project clean || exit 1
cp -RL linux-project $OUTDIR || exit 1
rm -rf $OUTDIR/{.settings,.cproject,.project}
tar cfz ${OUTDIR}.tar.gz $OUTDIR || exit 1
rm -rf $OUTDIR
echo ""

