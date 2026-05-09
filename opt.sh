iwasi=./sltz2der.wasm

wasm-opt \
	-O3 \
	-o opt.wasm \
	--enable-simd \
	--enable-relaxed-simd \
	--enable-bulk-memory \
	--enable-nontrapping-float-to-int \
	--enable-multivalue \
	"${iwasi}"
