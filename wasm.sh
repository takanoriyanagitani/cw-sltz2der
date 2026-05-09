#!/bin/sh

src="./sltz2der.c"
dst="./sltz2der.wasm"

zig \
	cc \
	-target wasm32-freestanding \
	-msimd128 \
	-mrelaxed-simd \
	-nostdlib \
	-Oz \
	-Wl,--strip-all \
	-fno-sanitize=undefined \
	-Wl,--no-entry \
	-Wl,--export="sltz2der" \
	-o "${dst}" \
	"${src}"
