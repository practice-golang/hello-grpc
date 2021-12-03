@echo off

cd gr-server
go mod tidy
go build -o ../bin
cd ..

cd gr-client
go mod tidy
go build -o ../bin
cd ..

@REM copy tls\pem\*.pem bin\

@REM Holy shxt npm
@REM npx webpack --mode production ./gr-js/client.js &^
npm install &^
npx webpack --mode development ./gr-js/client.js &^
cd web &^
copy ..\dist\main.js static\main.js /y &^
go build -o ../bin &^
cd ..
@REM del static\main.js &^
