FROM golang:1.20 AS build
WORKDIR /fullcycle/go/src
COPY hello-world.go .
RUN go build hello-world.go

FROM scratch
WORKDIR /app
COPY --from=build /fullcycle/go/src .
CMD ["./hello-world"]