package main

type Flavour string

type FlavoursResponse struct {
	Flavours []Flavour `json:"flavours"`
}

type FlavourPostRequest struct {
	Flavour Flavour `json:"flavour"`
}

func NewFlavoursResponse() *FlavoursResponse {
	return &FlavoursResponse{
		Flavours: flavours,
	}
}
