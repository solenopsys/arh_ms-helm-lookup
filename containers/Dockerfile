FROM --platform=$BUILDPLATFORM  golang:buster

ARG TARGETARCH



WORKDIR /app/main
COPY ../go.mod ./
COPY ../go.sum ./
COPY *.go ./
RUN go mod download

RUN  GOOS=linux GOARCH=$TARGETARCH go build  -o /go-binary

CMD [ "/go-binary" ]

