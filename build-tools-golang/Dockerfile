FROM --platform=${BUILDPLATFORM} golang:alpine AS build
# Redundant, current golang images already include ca-certificates
RUN apk --no-cache add ca-certificates

WORKDIR /src
ENV CGO_ENABLED=0
COPY ./src/go.mod ./src/go.sum ./
RUN go mod download
COPY ./src ./

ARG TARGETOS
ARG TARGETARCH
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /out/example .

FROM scratch AS bin-unix
COPY --from=build /out/example /

FROM bin-unix AS bin-linux
FROM bin-unix AS bin-darwin

FROM scratch AS bin-windows
COPY --from=build /out/example /example.exe

FROM bin-${TARGETOS} AS bin
