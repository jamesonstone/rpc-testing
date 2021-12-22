run:
	go run main.go
.PHONY: run

protoc-compile:
	protoc -I/Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/rpc --go_out=/Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/rpc /Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/rpc/addressbook.proto
.PHONY: protoc-compile
