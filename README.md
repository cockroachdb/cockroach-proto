# Cockroach Protocol Buffers

This repo contains protobuf definitions extracted from the [main cockroach repo](https://github.com/cockroachdb/cockroach). They have been cleaned by removing all [`gogoproto`](https://github.com/gogo/protobuf) extensions to facilitate compilation in other languages.

## Updating proto files

To update the files contained here, this repo must be checked out as a sibling of the main cockroach repo. Run `make build` in the cockroach repo (just once, to ensure dependencies are in place), and then run `make` in this one.
