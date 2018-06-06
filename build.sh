#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
# Configure
./configure --prefix=/usr \
            --sysconfdir=/etc \
            --with-readline=gnu &&
# Build and Install
make -j1 &&
make DESTDIR="$SHED_FAKE_ROOT" \
     install_doc_dir="$SHED_PKG_DOCS_INSTALL_DIR" \
     SLSH_DOC_DIR="${SHED_PKG_DOCS_INSTALL_DIR}/slsh" \
     install &&
# Fix Permissions
chmod -v 755 "${SHED_FAKE_ROOT}/usr/lib/libslang.so.2.3.2" \
             "${SHED_FAKE_ROOT}"/usr/lib/slang/v2/modules/*.so
# Optionally Remove Documentation
if [ -z "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    rm -rf "${SHED_FAKE_ROOT}${SHED_PKG_DOCS_INSTALL_DIR}"
fi
