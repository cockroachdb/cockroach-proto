.PHONY: all
all: build

# Import a makefile from cockroach's build to get path definitions.
# This uses relative paths so it must be invoked with the correct
# working directory (see the main Makefile).
include cockroach/build/protobuf.mk

PROTO_REWRITE=cockroach-proto/.vendor/bin/proto-rewrite

# Only generate protos that are intended to be used by clients.
CLIENT_PROTOS=$(filter ./cockroach/sql/driver/%,$(GO_PROTOS))

.PHONY: build
build:
	for dir in $(sort $(dir $(CLIENT_PROTOS))); do \
		mkdir -p cockroach-proto/$$dir; \
		$(PROTO_REWRITE) --protoc=$(PROTOC) \
			--proto_path=.:$(GOGOPROTO_PATH):$(COREOS_PATH) \
			--out=cockroach-proto/$$dir --filters=strip_gogo_options $$dir*.proto; \
	done
