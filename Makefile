JS_SRC = src/js/index.jsx
JS_TARGET = public/main.js

LESS_DIR = src/less/
LESS_SRC = $(LESS_DIR)style.less
LESS_TARGET = public/style.css

WATCHIFY = ./node_modules/.bin/watchify
EXORCIST = ./node_modules/.bin/exorcist
WATCH = ./node_modules/.bin/watch
LESSC = ./node_modules/.bin/lessc

watch-js:
	$(WATCHIFY) --verbose --debug -t [ babelify --presets [ es2015 react ] ] -o $(JS_TARGET) -- $(JS_SRC) | $(EXORCIST) $(JS_TARGET).map > $(JS_TARGET)

watch-css:
	$(WATCH) '$(LESSC) $(LESS_SRC) $(LESS_TARGET)' $(LESS_DIR)

watch:
	make -j4 watch-js watch-css