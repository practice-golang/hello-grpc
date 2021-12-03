@echo off

cd bin
start gr-server
start grpcwebproxy --backend_addr=localhost:50051 --server_http_debug_port=9981 --run_tls_server=false --allow_all_origins
start web