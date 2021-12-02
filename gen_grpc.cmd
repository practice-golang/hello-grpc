@echo off

set PATH=%cd%\bin;%PATH%

@REM Go server and client
protoc -I=. --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative ./proto/hello.proto

@REM js server
protoc -I=. --js_out=import_style=commonjs:. ./proto/hello.proto

@REM js client
protoc -I=. --grpc-web_out=import_style=commonjs,mode=grpcwebtext:. ./proto/hello.proto