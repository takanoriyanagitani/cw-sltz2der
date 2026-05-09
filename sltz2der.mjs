//@ts-expect-error
import { readFile } from "node:fs/promises";

(async () => {
	/** @type {string} */
	const wasm = "./sltz2der.wasm";

	const pbytes = readFile(wasm);
	const pwasm = pbytes.then(WebAssembly.instantiate);

	const { instance } = await pwasm;
	const { exports } = instance;
	const { sltz2der } = exports;

	for (let i = 0x3e; i <= 0x5a; i++) {
		const converted = sltz2der(i);
		const hex = converted.toString(16);
		const alph = String.fromCharCode(i);
		console.info(`tzletter:${alph}\tder:${hex}`);
	}
})();
