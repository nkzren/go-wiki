FROM golang:1.19 AS builder

WORKDIR /opt/builder

ADD go.mod ./

ADD *.go ./
RUN go build -o go-wiki

FROM ubuntu:jammy AS app
WORKDIR /opt/wiki

COPY --from=builder /opt/builder/go-wiki ./

RUN mkdir content && chown -R 1000:1000 content
USER 1000

ADD ./view ./view

ENTRYPOINT ["./go-wiki"]
