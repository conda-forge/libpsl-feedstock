# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build-aux
set -ex

meson setup builddir \
	--prefix=$PREFIX \
	--libdir=lib \
	-Druntime=libicu \
	-Dbuiltin=libicu
ninja -v -C builddir -j ${CPU_COUNT}
ninja -C builddir install -j ${CPU_COUNT}
