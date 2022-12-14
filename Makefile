SHELL := bash
PWD := $(shell pwd)
PROJECT_NAME := $(shell pwd | sed "s#.*/##")
BIN := ${PROJECT_NAME}

all: build run

# C/C++ code
clean:
	rm -rf build/*

build: clean
	mkdir -p bin
	cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
	cmake --build build
	find build/src -type f -executable | while read f; do \
		cp -v $$f bin; \
	done

run:
	./bin/${BIN}

build-linux-image:
	docker build . -t ${PROJECT_NAME}/linux -f docker/Dockerfile.linux

rebuild-linux-image:
	docker build . -t ${PROJECT_NAME}/linux -f docker/Dockerfile.linux --no-cache

docker-build: clean
	mkdir -p bin
	docker run --rm -it -v $(shell pwd):/app ${PROJECT_NAME}/linux
	find build/src -type f -executable | while read f; do \
		cp -v $$f bin; \
	done

for-docker: # This is for docker-build (DO NOT run this!)
	cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
	cmake --build build
