package main

type Order struct {
	Flavour  string `json:"flavour"`
	Quantity int    `json:"quantity"`
}

type GetOrdersResponse struct {
	Orders []Order `json:"orders"`
}

type CreateOrderRequest struct {
	Scoop []Order `json:"scoop"`
}

func NewGetOrdersResponse() *GetOrdersResponse {
	return &GetOrdersResponse{
		Orders: orders,
	}
}
