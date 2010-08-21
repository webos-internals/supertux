APP_ID=$(shell grep id appinfo.json | cut -f4 -d\")
VERSION=$(shell grep version appinfo.json | cut -f4 -d\")
.PHONY: package-pre build-pre install-usb all

all: package-pre install-usb

package-pre: build-pre
	mkdir -p build/data
	cp binaries/armv7/supertux build/
	cp appinfo.json build/
	cp package.properties build/
	cp icon.png build/
	rsync -a data/ build/data
	palm-package build/

build-pre:
	${MAKE} -C src
	cp src/supertux binaries/armv7/supertux

install-usb:
	palm-install ${APP_ID}_${VERSION}_all.ipk

clean:
	${MAKE} -C src clean
	rm -rf build
	rm -f *.ipk
