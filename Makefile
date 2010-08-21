.PHONY: package-pre build-pre

package-pre: build-pre
	mkdir -p build/data
	cp binaries/armv7/supertux build/
	cp appinfo.json build/
	cp icon.png build/
	rsync -a data/ build/data
	palm-package build/

build-pre:
	${MAKE} -C src
	mv src/supertux binaries/armv7/supertux
