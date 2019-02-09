build: build-json build-elm build-js

build-json:
	node build.js

build-elm:
	elm make --optimize src/Main.elm --output=elm.js

build-js: build-elm
	node ./node_modules/.bin/uglifyjs elm.js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | node ./node_modules/.bin/uglifyjs --beautify semicolons=false --mangle --output=elm.min.js

