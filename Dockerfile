#
# .-'_.---._'-.
# ||####|(__)||   Protect your secrets, protect your business.
#   \\()|##//       Secure your sensitive data with Aegis.
#    \\ |#//                    <aegis.ist>
#     .\_/.
#

# builder image
FROM golang:1.20.1-alpine3.17 as builder

RUN mkdir /build
ADD *.go /build/
ADD go.mod /build/
# COPY vendor /build/vendor
WORKDIR /build
RUN CGO_ENABLED=0 GOOS=linux go build -mod vendor -a -o aegis-workload-demo ./main.go

# generate clean, final image for end users
FROM gcr.io/distroless/static-debian11

LABEL "maintainers"="Volkan Özçelik <volkan@aegis.ist>"
LABEL "version"="1.3.0"
LABEL "website"="https://aegis.ist/"
LABEL "repo"="https://github.com/zerotohero-dev/aegis-workload-demo-using-init-container"
LABEL "documentation"="https://aegis.ist/docs/"
LABEL "contact"="https://aegis.ist/contact/"
LABEL "community"="https://aegis.ist/contact/#community"
LABEL "changelog"="https://aegis.ist/changelog"

COPY --from=builder /build/aegis-workload-demo .

# executable
ENTRYPOINT [ "./aegis-workload-demo" ]
CMD [ "" ]
