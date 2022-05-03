package main

type Order struct {
	Flavour  string `json:"flavour"`
	Quantity int    `json:"quantity"`
}

type CreateOrderRequest struct {
	Scoop []Order `json:"scoop"`
}
