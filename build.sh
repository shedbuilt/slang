#!/bin/bash
./configure --prefix=/usr \
            --sysconfdir=/etc \
            --with-readline=gnu &&
make -j1 &&
make DESTDIR="$SHED_FAKEROOT" \
     install_doc_dir=/usr/share/doc/slang-2.3.2 \
     SLSH_DOC_DIR=/usr/share/doc/slang-2.3.2/slsh \
     install &&
chmod -v 755 "${SHED_FAKEROOT}/usr/lib/libslang.so.2.3.2" \
             "${SHED_FAKEROOT}"/usr/lib/slang/v2/modules/*.so
