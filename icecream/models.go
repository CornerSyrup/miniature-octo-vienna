package main

type Flavour string

type FlavoursResponse struct {
	Flavours []Flavour `json:"flavours"`
}

func NewFlavoursResponse() *FlavoursResponse {
	return &FlavoursResponse{
		Flavours: []Flavour{"chocolate", "mint", "vanilla"},
	}
}
