package main

type Flavour string

type ListFlavoursResponse struct {
	Flavours []Flavour `json:"flavours"`
}

type CreateFlavourRequest struct {
	Flavour Flavour `json:"flavour"`
}

func NewListFlavoursResponse() *ListFlavoursResponse {
	return &ListFlavoursResponse{
		Flavours: flavours,
	}
}
