@echo off

set GOBIN=%cd%\bin

curl.exe -Lo protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.19.1/protoc-3.19.1-win64.zip
unzip.exe -oq protoc.zip -d protobuf
copy protobuf\bin\protoc.exe bin\protoc.exe

del protoc.zip /q /s
rd protobuf /s /q

go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest


@REM js
curl.exe -Lo ./bin/protoc-gen-grpc-web.exe https://github.com/grpc/grpc-web/releases/download/1.3.0/protoc-gen-grpc-web-1.3.0-windows-x86_64.exe

curl.exe -Lo grpcwebproxy.zip https://github.com/improbable-eng/grpc-web/releases/download/v0.15.0/grpcwebproxy-v0.15.0-win64.exe.zip
unzip.exe -oq grpcwebproxy.zip -d bin
copy bin\dist\grpcwebproxy-v0.15.0-win64.exe bin\grpcwebproxy.exe
del grpcwebproxy.zip /q /s
rd bin\dist /q /s


@REM grpcurl
curl.exe -Lo grpcurl.zip https://github.com/fullstorydev/grpcurl/releases/download/v1.8.5/grpcurl_1.8.5_windows_x86_64.zip
unzip.exe -oq grpcurl.zip -d grpcurl