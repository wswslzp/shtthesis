#!/bin/bash

# shtthesis, an unofficial LaTeX thesis template for ShanghaiTech University.
# Copyright (C) 2020 Li Rundong <rundong.001@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>

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