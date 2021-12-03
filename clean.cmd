@echo off

del bin\* /q /s
rd hello /q /s
rd dist /q /s

del proto\*.go /q /s
del proto\*.js /q /s
del proto\*.protoset /q /s
del web\static\main.js /q /s

del grpcurl\grpcurl.exe /q /s
del grpcurl\LICENSE /q /s
