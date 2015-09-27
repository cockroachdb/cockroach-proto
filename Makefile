.PHONY: all
all: build

.bootstrap: Bunchfile.lock
	go get github.com/dkulchenko/bunch
	bunch install
	touch .bootstrap

# Delegate to a second makefile to manipulate the working directory
# (required by protobuf.mk).
.PHONY: build
build:
	make -C .. -f cockroach-proto/rewrite.mk
