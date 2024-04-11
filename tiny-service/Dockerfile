FROM --platform=$BUILDPLATFORM golang:1.22.1 as builder

ARG TARGETOS
ARG TARGETARCH

ARG MESSAGE=$MESSAGE

WORKDIR /app/
COPY main.go .
COPY go.mod .

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags="-s -w" -o tiny-service main.go

FROM --platform=$TARGETPLATFORM scratch
WORKDIR /app/
COPY --from=builder /app/tiny-service /
ENV MESSAGE=$MESSAGE
EXPOSE 8080
CMD ["/tiny-service"]

# docker run --env MESSAGE="hello world" -p 8080:8080 philippecharriere494/hello-go:0.0.0