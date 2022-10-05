FROM golang:1.19 AS builder

WORKDIR /opt/builder
ADD *.go ./
RUN ["go", "build", "wiki.go"]

FROM ubuntu:jammy AS app
WORKDIR /opt/wiki

ADD ./view ./view
COPY --from=builder /opt/builder/wiki ./

RUN mkdir content && chown -R 1000:1000 content
USER 1000

ENTRYPOINT ["./wiki"]
