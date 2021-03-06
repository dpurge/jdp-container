ARG ALPINE_VERSION="3.13"

FROM alpine:${ALPINE_VERSION} as Hugo

RUN apk add --update --no-cache libc6-compat libstdc++

ARG HUGO_VERSION="0.80.0"

ENV HUGO_RELEASES "https://github.com/gohugoio/hugo/releases"
ENV HUGO_OS "Linux"
ENV HUGO_ARCH "64bit"
ENV HUGO_ARTIFACT "hugo_extended_${HUGO_VERSION}_${HUGO_OS}-${HUGO_ARCH}"
ENV HUGO_EXT "tar.gz"
ENV HUGO_ARCHIVE "${HUGO_ARTIFACT}.${HUGO_EXT}"
ENV HUGO_DIR "${HUGO_ARTIFACT}"
ENV HUGO_BINARY "hugo"
ENV HUGO_SITE "/site"

ADD "${HUGO_RELEASES}/download/v${HUGO_VERSION}/${HUGO_ARCHIVE}" /tmp

RUN mkdir -p "/tmp/${HUGO_DIR}" \
    && tar zxf "/tmp/${HUGO_ARCHIVE}" -C "/tmp/${HUGO_DIR}" \
    && rm -f "/tmp/${HUGO_ARCHIVE}" \
    && mv "/tmp/${HUGO_DIR}/${HUGO_BINARY}" "/usr/bin/${HUGO_BINARY}" \
    && rm -rf "/tmp/${HUGO_DIR}" \
    && mkdir -p "${HUGO_SITE}"

WORKDIR "${HUGO_SITE}"
COPY ./site .

CMD ["hugo", "--destination",  "public"]

FROM nginx
COPY --from=Hugo /site/public /usr/share/nginx/html
EXPOSE 80
