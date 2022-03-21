# gRPC Overview

- `addressbook.proto` - This is the file that defines the message structure.
- `addressbook.pb.go` - This is the generated code that implements the message structure.

## `addressbook.proto`

`addressbook.proto` is the protocol definition. This file defines the message structure.

### `addressbook.proto` Header

- `syntax` - defines the version of the protocol to use. We're using `proto3`.
- `package` - defines the package name; helps namespace different message types.
- `import` - import statements can be used to import other types or objects ([example](https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/timestamp.proto))
- `option go_package` - defines the import path/directory for the generated go code. The package name will default to the tail directory of the path

### `addressbook.proto` Messages and Fields

- `message` - defines the message object structure for serialization. Multiple messages can be defined in the same file.
- `=1-15` - unique "tag" identifier for each field used for binary encoding. These can be thought of as an alias for each respective field. 1-15 require one less byte making them the best candidates for optimization of repeated fields.
- `=16-` - best used for less used or optional fields because they require an additional byte to encode.
- `repeated` - indicates that the field is repeated (including 0 times). These can be thought up of order-preserving dynamically sized arrays.

## Code Generation

```bash
protoc -I=/Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/examples/helloworld --go_out=/Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/examples/helloworld/ --go-grpc_out=/Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/examples/helloworld/ /Users/jameson.stone/go/src/github.com/jstone28/rpc-testing/examples/helloworld/helloworld.proto
```

where:

- `protoc` - is the `protoc` protocol buffer compiler binary.
- `-I` - specifies the directory to search for imports.
- `--go_out=<path>` - specifies the output directory for the generated code. Passed in is an override for the default specified in the `option go_package` in the `.proto` file.
- `--go-grpc_out` - specifies the output directory for grpc client and server code.

So that:

```bash
protoc -I<path to imports> --go_out=<path to output> <path to proto file>
```
