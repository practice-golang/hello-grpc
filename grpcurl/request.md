<!-- Common -->
grpcurl -proto ../proto/hello.proto localhost:50051 list
grpcurl -v -plaintext -proto ../proto/hello.proto localhost:50051 hello.Greeter/SayHello

<!-- xNIX -->
./grpcurl -plaintext -d '{"name": "doe"}' -proto ../proto/hello.proto localhost:50051 hello.Greeter/SayHello

<!-- Not work -->
./grpcurl -plaintext -d '{"name": "Laurent"}' -proto ../proto/hello.proto localhost:50051 hello.Greeter/SayHello

<!-- Windows powershell, not cmd -->
$params = @{ "name" = "doe" }
$params | ConvertTo-Json -Compress | ./grpcurl -plaintext -d '@' -proto ../proto/hello.proto localhost:50051 hello.Greeter/SayHello
