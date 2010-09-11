APP_ID=$(shell grep id pkg_base/appinfo.json | cut -f4 -d\")
VERSION=$(shell grep version pkg_base/appinfo.json | cut -f4 -d\")
.PHONY: package-pre build-pre install-usb all

all: package-pre install-usb

package-pre: build-pre
	rm -rf build
	mkdir -p ipkgs
	cp -r pkg_base build
	cp -r data build/
	cp binaries/armv7/supertux build/
	palm-package build/
	mv ${APP_ID}_${VERSION}_all.ipk ipkgs/

build-pre:
	${MAKE} -C src
	cp src/supertux binaries/armv7/supertux
	${CROSS_COMPILE}strip binaries/armv7/supertux

install-usb:
	novacom put file:///media/cryptofs/apps/usr/palm/applications/org.webosinternals.supertux/supertux < src/supertux
	#palm-install ${APP_ID}_${VERSION}_all.ipk

clean:
	${MAKE} -C src clean
	rm -rf build
	rm -f *.ipk
