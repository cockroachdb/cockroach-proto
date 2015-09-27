# Cockroach Protocol Buffers

This repo contains protobuf definitions extracted from the [main cockroach repo](https://github.com/cockroachdb/cockroach). They have been cleaned by removing all [`gogoproto`](https://github.com/gogo/protobuf) extensions to facilitate compilation in other languages.

The directory `cockroach/sql/driver` contains all the `.proto` files expected to be used by clients and has no dependencies. For client development, it is generally easier to compile this directory alone instead of building all protos in the package. The file `cockroach/multiraft/rpc.proto` is particularly tricky to compile due to its dependency on protos defined by `etcd` (and thereby indirectly retaining a dependency on `gogoproto`).

## Updating proto files

To update the files contained here, this repo must be checked out as a sibling of the main cockroach repo. Run `make build` in the cockroach repo (just once, to ensure dependencies are in place), and then run `make` in this one.
