package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

const (
	PORT = 80
)

func main() {
	http.HandleFunc("/flavours", Flavours)

	log.Printf("Listening on port %d", PORT)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", PORT), nil))
}

func Flavours(w http.ResponseWriter, r *http.Request) {
	buf, _ := json.Marshal(NewFlavoursResponse())
	w.Header().Set("Content-Type", "application/json")
	w.Write(buf)
}
