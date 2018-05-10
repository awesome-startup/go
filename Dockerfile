FROM containerize/dep AS builder
WORKDIR /go/src/github.com/gotoolkit/golang
COPY . .
RUN go install .

FROM alpine:3.7
RUN apk add --no-cache ca-certificates
WORKDIR /home
COPY --from=builder /go/bin/golang /usr/local/bin/golang
ENTRYPOINT ["golang"]