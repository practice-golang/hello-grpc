package main // import "web"

import (
	"embed"
	"log"
	"net/http"
)

//go:embed static/index.html
var indexPage []byte

//go:embed static/*
var static embed.FS

func main() {
	staticFs := http.FileServer(http.FS(static))

	mux := http.NewServeMux()
	mux.Handle("/static", staticFs)
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(200)
		w.Write(indexPage)
	})

	mux.HandleFunc("/main.js", func(w http.ResponseWriter, r *http.Request) {
		log.Println("Requested URI: ", r.URL.Path)

		data, err := static.ReadFile("static/main.js")
		if err != nil {
			http.Error(w, "Couldn't read file", http.StatusInternalServerError)
			return
		}
		w.Header().Add("Strict-Transport-Security", "max-age=63072000; includeSubDomains")
		w.Header().Set("Content-Type", "application/javascript; charset=utf-8")
		w.WriteHeader(200)
		w.Write(data)
	})

	// err := http.ListenAndServeTLS(":8864", "cert.pem", "key.pem", mux)
	err := http.ListenAndServe(":8864", mux)
	if err != nil {
		log.Fatal(err)
	}

	// cfg := &tls.Config{
	// 	MinVersion:               tls.VersionTLS12,
	// 	CurvePreferences:         []tls.CurveID{tls.CurveP521, tls.CurveP384, tls.CurveP256},
	// 	PreferServerCipherSuites: true,
	// 	CipherSuites: []uint16{
	// 		tls.TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,
	// 		tls.TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,
	// 		tls.TLS_RSA_WITH_AES_256_GCM_SHA384,
	// 		tls.TLS_RSA_WITH_AES_256_CBC_SHA,
	// 	},
	// }
	// srv := &http.Server{
	// 	Addr:         ":443",
	// 	Handler:      mux,
	// 	TLSConfig:    cfg,
	// 	TLSNextProto: make(map[string]func(*http.Server, *tls.Conn, http.Handler)),
	// }
	// log.Fatal(srv.ListenAndServeTLS("cert.pem", "key.pem"))
}
