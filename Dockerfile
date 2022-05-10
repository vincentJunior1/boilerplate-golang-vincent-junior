FROM golang:1.15-alpine as builder

RUN apk update && \
    apk upgrade

WORKDIR /app
COPY . . 

RUN apk add curl gcc g++ make git --no-cache \ 
    && chmod +x install.sh && sh install.sh && cp ./bin/air /bin/air \
    && mkdir -p /app 

EXPOSE 3006

CMD ["sh", "-c","air"]