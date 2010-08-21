OBJECTS = badguy.o bitmask.o button.o collision.o configfile.o gameloop.o gameobjs.o globals.o high_scores.o intro.o level.o leveleditor.o lispreader.o menu.o mousecursor.o music_manager.o musicref.o particlesystem.o physic.o player.o resources.o scene.o screen.o setup.o sound.o special.o sprite.o sprite_manager.o supertux.o text.o texture.o tile.o timer.o title.o type.o world.o worldmap.o

STATIC_LIBS=zlib/libz.a

#PXI_CXXFLAGS=mcpu=arm1136jf-s -mfpu=vfp -mfloat-abi=softfp
CXXFLAGS=-mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp \
				 -g -O2 \
				 -DNOOPENGL \
				 -D_GNU_SOURCE=1 \
				 -DVERSION=\"0.1.3\" \
				 -DDATA_PREFIX=\"/media/internal/share/supertux\" \
				 -I/opt/PalmPDK/include/SDL \
				 -Izlib

LDFLAGS=-lSDL -lSDL_image -lSDL_mixer -L/opt/PalmPDK/device/lib -Wl,--allow-shlib-undefined

supertux: ${OBJECTS}
	${CXX} -o $@ ${OBJECTS} ${STATIC_LIBS} ${LDFLAGS}

clean:
	rm -f supertux ${OBJECTS}
