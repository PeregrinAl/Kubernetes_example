FROM python:3.14-alpine

RUN mkdir -p /app
WORKDIR /app

COPY hello.html /app/hello.html

RUN addgroup -g 10001 appgroup \
    && adduser -D -u 10001 -G appgroup appuser \
    && chown -R 10001:10001 /app

USER 10001

EXPOSE 8000

CMD ["python", "-m", "http.server", "8000"]
