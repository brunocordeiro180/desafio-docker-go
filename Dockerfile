FROM golang:1.17-alpine AS builder

WORKDIR /go/src/app
COPY . .
RUN go build hello.go

FROM scratch

WORKDIR /go/src/app

COPY --from=builder /go/src/app .

CMD ["./hello"]