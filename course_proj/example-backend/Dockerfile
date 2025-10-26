FROM golang:1.16-alpine AS build

WORKDIR /usr/src/app

COPY . .

# Build statically linked binary for scratch
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o server


# production
FROM scratch

WORKDIR /usr/src/app

# Copy binary and CA certificates (for HTTPS)
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /usr/src/app/server /usr/src/app/server

EXPOSE 8080

USER 65532:65532

ENTRYPOINT ["/usr/src/app/server"]