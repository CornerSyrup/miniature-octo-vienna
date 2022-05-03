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

var (
	orders []Order
)

func main() {
	http.HandleFunc("/order", Orders)

	log.Printf("Listening on port %d", PORT)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", PORT), nil))
}

func Orders(w http.ResponseWriter, r *http.Request) {
	switch r.Method {
	case "GET":
		buf, _ := json.Marshal(NewGetOrdersResponse())
		w.Header().Set("Content-Type", "application/json")
		w.Write(buf)
	case "POST":
		buf := make([]byte, r.ContentLength)
		r.Body.Read(buf) // expect good client
		defer r.Body.Close()

		req := new(CreateOrderRequest)
		json.Unmarshal(buf, req)

		orders = append(orders, req.Scoop...)
	default:
		w.WriteHeader(http.StatusMethodNotAllowed)
	}
}
