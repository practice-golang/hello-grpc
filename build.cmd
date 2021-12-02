@echo off

cd gr-server
go mod tidy
go build -o ../bin
cd ..

cd gr-client
go mod tidy
go build -o ../bin
cd ..
