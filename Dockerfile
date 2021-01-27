FROM golang:1.15.7-buster as builder

WORKDIR /download

RUN go get google.golang.org/protobuf/cmd/protoc-gen-go
RUN go get google.golang.org/grpc/cmd/protoc-gen-go-grpc
RUN export PATH="$PATH:$(go env GOPATH)/bin"
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.14.0/protoc-3.14.0-linux-x86_64.zip
RUN wget https://golang.org/dl/go1.15.7.linux-amd64.tar.gz
RUN apt-get update
RUN apt-get install -y zip
RUN unzip protoc-3.14.0-linux-x86_64.zip -d protoc
RUN tar -xzf go1.15.7.linux-amd64.tar.gz

FROM ubuntu:18.04
WORKDIR /work
COPY --from=builder /go/bin/* /usr/local/bin/
COPY --from=builder /download/protoc/bin/* /usr/local/bin/
COPY --from=builder /download/go/bin/* /usr/local/go/
ENV PATH="$PATH:/usr/local/go"
