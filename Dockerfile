FROM golang:1.12.3-alpine3.9 as builder
RUN mkdir /app 
ENV GODIR /go
ENV WORKDIR ${GODIR}/src/github.com/operry/serviceb
ENV GOPATH ${GODIR}
WORKDIR ${WORKDIR}
COPY . ${WORKDIR}
RUN go build -o /app/serviceb .

FROM alpine:3.9
COPY --from=builder /app/serviceb /serviceb
EXPOSE 8080
CMD ["/serviceb"]
