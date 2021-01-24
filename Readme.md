# Protcol Buffer Protoc for Golang

This image is used to generate protocol buffer and gRPC files from *.proto files

## Example
```
docker run --rm -it -v $(pwd):/work clazz/protoc-grpc-generator-go:1.1.0 protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative *.proto
```

User the volume where you store yout *.proto files and map volume to '/work'