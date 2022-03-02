FROM alpine:latest as alpine_multistage 
RUN mkdir /usr/app
WORKDIR /usr/app
RUN touch index.html



FROM nginx:latest 
WORKDIR /usr/share/nginx/html
COPY --from=alpine_multistage /usr/app/index.html . 
RUN echo 'helloworld' > index.html
