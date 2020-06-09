#!/bin/bash

PKG_NAME=shtthesis
PKG_CONTENT="\
  shtthesis.cls \
  shtthesis-user-guide.tex \
  shtthesis-user-guide.pdf \
  shtthesis-gbt7714-plain.bst \
  reference.bib \
  README.md \
  LICENSE \
  CHANGELOG.md \
  "
if [ -x "$(command -v gtar)" ]; then
  TAR_EXE=gtar # macOS
else
  TAR_EXE=tar
fi

$TAR_EXE --transform "s/^/$PKG_NAME\//" -zcf $PKG_NAME.tar.gz $PKG_CONTENT