FROM caddy:2.8.4-builder AS builder
RUN xcaddy build --with github.com/baldinof/caddy-supervisor

FROM php:8.3.17-fpm-alpine AS base
RUN apk --no-cache add bash patch unzip zip zlib
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
        @composer \
        amqp \
    	pdo_pgsql \
    	gd \
    	intl \
    	zip

ARG COMPOSER_FLAGS="--no-interaction --no-progress --ansi"
ENV COMPOSER_ALLOW_SUPERUSER=1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY ./Caddyfile /usr/local/etc/Caddyfile

WORKDIR /app
EXPOSE 80
CMD ["caddy", "run", "--config", "/usr/local/etc/Caddyfile"]

FROM base AS dev
RUN install-php-extensions xdebug
COPY --link ./conf.d/xdebug.ini /usr/local/etc/conf.d/xdebug.ini
COPY --link ./conf.d/error_reporting.dev.ini /usr/local/etc/conf.d/error_reporting.ini
COPY --link ./php-fpm.d/zz-docker.dev.conf /usr/local/etc/php-fpm.d/zz-docker.conf

FROM base AS prod
ENV APP_ENV=prod
RUN install-php-extensions opcache
COPY --link ./php-fpm.d/zz-docker.prod.conf /usr/local/etc/php-fpm.d/zz-docker.conf