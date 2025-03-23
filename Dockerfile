FROM alpine:3.18

RUN apk update && apk add --no-cache ca-certificates

COPY otelcol /otelcol

RUN chmod +x /otelcol


# OTLP gRPC (4317), OTLP HTTP (4318), Prometheus exporter (8899)
EXPOSE 4317 4318 8899

CMD ["/otelcol", "--config", "/conf/collector-config.yaml"]
