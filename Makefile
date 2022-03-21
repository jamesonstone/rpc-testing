run:
	go run main.go
.PHONY: run

protoc-compile:
	protoc -I=/Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/pb --go_out=/Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/pb /Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/pb/addressbook.proto
.PHONY: protoc-compile

