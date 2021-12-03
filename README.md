# gRPC 찍먹
grpc 웹페이지에서 제공하는 `Helloworld` 예제를 도커 없이 맛보기

## 요약
* 빌드 및 실행: `all.cmd` 실행 -> `run.cmd` 실행
* 정리: `clean.cmd` 실행
* 클라이언트 실행
    * Go: `bin/gr-client`
    * 웹: http://localhost:8864
* 프로세스 종료: 그런거 없다.

## Go
* 원본: https://github.com/grpc/grpc-go/tree/master/examples/helloworld
* 설명: https://grpc.io/docs/languages/go/quickstart/

## JS
* 원본: https://github.com/grpc/grpc-web/tree/master/net/grpc/gateway/examples/helloworld
* 설명: https://grpc.io/docs/platforms/web/basics/
* `grpcwebproxy`: Go 백엔드 리버스프록시 용도. Content type, CORS 등의 문제로 필요

## grpcurl - 파워쉘
* `grpcurl/request.md`
```powershell
prompt> $params = @{ "name" = "doe" }
prompt> $params | ConvertTo-Json -Compress | ./grpcurl -plaintext -d '@' -proto ../proto/hello.proto localhost:50051 hello.Greeter/SayHello
```

## vscode용 gRPC 확장
* [gRPC Client](https://marketplace.visualstudio.com/items?itemName=pashkatrick.grpc-client)
* [vscode-proto3](https://marketplace.visualstudio.com/items?itemName=zxh404.vscode-proto3)


## js, css content type 문제
* https://stackoverflow.com/questions/28899675/include-js-file-in-go-template/28899786#28899786


## Certificates 생성 - 평문이라서 필요 없음
* localhost에서 TLS 사용 목적. keygen은 `ssl-keygen.zip` 압축을 먼저 해제
* 아래와 같이 인증 파일 생성
```
cd tls/keygen/ssl-keygen
keygen.cmd

move *.pem ../pem/
```
