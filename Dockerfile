FROM golang:alpine3.19

USER root
WORKDIR /app

COPY . .

RUN go mod download && go mod verify

RUN go build main.go

ENTRYPOINT [ "./main" ]