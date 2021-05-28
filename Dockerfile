FROM alpine:latest

RUN apk add build-base clang git

RUN clang-format --version
COPY . /format-check/
RUN chmod +x /format-check/run.sh
ENTRYPOINT ["sh","/format-check/run.sh", "hello"]
