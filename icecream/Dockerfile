FROM golang:1.18.1-alpine3.15 as build

WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 go build -o main .
# use CGO to prevent libraries link dynamically

FROM scratch as serve

COPY --from=build /usr/src/app/main /usr/bin/server

ENTRYPOINT [ "server" ]
