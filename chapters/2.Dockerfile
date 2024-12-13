# syntax=docker/dockerfile:1
FROM golang:1.20-buster
WORKDIR /src
COPY go.mod go.sum .
RUN go mod download
COPY . .
RUN go build -o /bin/client ./cmd/client
RUN go build -o /bin/server ./cmd/server
ENTRYPOINT [ "/bin/server" ]
