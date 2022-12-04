#!/bin/bash
set -e

# shtthesis, an unofficial LaTeX thesis template for ShanghaiTech University.
# Copyright (C) 2022 Li Rundong <rundong.001@gmail.com>
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
PKG_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
RELEASE_DIR=${PKG_ROOT}/release/${PKG_NAME}
BASE_CONTENT="\
  shtthesis.cls \
  shtthesis-user-guide.tex \
  README.md \
  LICENSE \
  CHANGELOG.md \
  "
OVER_LEAF_CONTENT="\
  ${BASE_CONTENT}
  shanghaitech-emblem.pdf
  "
CTAN_CONTENT="\
  ${BASE_CONTENT}
  DEPENDS.txt
  shtthesis-user-guide.pdf \
  "

rm -rf ${PKG_ROOT}/release
mkdir -p ${RELEASE_DIR}
pushd ${PKG_ROOT}/release
for f in $OVER_LEAF_CONTENT; do
  cp ${PKG_ROOT}/$f ${RELEASE_DIR}/
done
zip -r -q -9 ${PKG_NAME}-overleaf.zip ${PKG_NAME}
rm -rf ${RELEASE_DIR}/*
for f in $CTAN_CONTENT; do
  cp ${PKG_ROOT}/$f ${RELEASE_DIR}/
done
zip -r -q -9 ${PKG_NAME}-ctan.zip ${PKG_NAME}
rm -rf ${RELEASE_DIR}
popd

echo "Relase archives ready in:"
echo -e "\trelease/${PKG_NAME}-ctan.zip"
echo -e "\trelease/${PKG_NAME}-overleaf.zip"
