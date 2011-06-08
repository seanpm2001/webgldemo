
all: build
run:
	./main.exe -d
build: main.exe

main.exe:
	cd plugins && make all
	opa --project-root '$(shell pwd)' --js-no-cleanup --js-no-global-inlining --js-no-local-inlining --js-no-local-renaming \
		plugins/requestAnimationFramePlugin.opp src/requestAnimationFrame.opa \
		plugins/webglPlugin.opp src/webgl/webgl.opa \
		plugins/glMatrixPlugin.opp src/glMatrix/glMatrix.opa \
		src/custom_shaders.opa \
		src/engine/stack.opa src/engine/engine.opa \
		src/main.opa
	mv src/main.exe main.exe



clean:
	cd plugins && make clean
	rm -rf _build _tracks \.mlstate main.exe src/main.exe *\.opx *\.opx.broken

.PHONY: all run build clean main.exe
