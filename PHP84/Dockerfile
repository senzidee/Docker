FROM caddy:2.10.0-builder AS builder
RUN xcaddy build --with github.com/baldinof/caddy-supervisor

FROM php:8.4.16-alpine AS cli
RUN apk --no-cache add bash patch unzip zip zlib
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
        @composer \
    	pdo_pgsql \
    	gd \
    	intl \
    	zip

ARG COMPOSER_FLAGS="--no-interaction --no-progress --ansi"
ENV COMPOSER_ALLOW_SUPERUSER=1
WORKDIR /app

FROM php:8.4.16-fpm-alpine AS fpm
RUN apk --no-cache add bash patch unzip zip zlib
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
        @composer \
    	pdo_pgsql \
    	gd \
    	intl \
    	zip

ARG COMPOSER_FLAGS="--no-interaction --no-progress --ansi"
ENV COMPOSER_ALLOW_SUPERUSER=1
WORKDIR /app

FROM cli AS cli-dev
RUN install-php-extensions xdebug
COPY --link ./conf.d/xdebug.ini /usr/local/etc/conf.d/xdebug.ini
COPY --link ./conf.d/error_reporting.dev.ini /usr/local/etc/conf.d/error_reporting.ini

FROM cli-dev AS grpc-dev
RUN install-php-extensions grpc
COPY --link ./conf.d/max_allowed_stack.ini /usr/local/etc/php/conf.d/max_allowed_stack.ini

FROM cli-dev AS amqp-dev
RUN install-php-extensions amqp

FROM cli-dev AS redis-dev
RUN install-php-extensions redis

FROM cli-grpc-dev AS grpc-amqp-dev
RUN install-php-extensions amqp

FROM cli-grpc-dev AS grpc-redis-dev
RUN install-php-extensions redis


FROM fpm AS fpm-dev
RUN install-php-extensions xdebug
COPY --link ./conf.d/xdebug.ini /usr/local/etc/conf.d/xdebug.ini
COPY --link ./conf.d/error_reporting.dev.ini /usr/local/etc/conf.d/error_reporting.ini
COPY --link ./php-fpm.d/zz-docker.dev.conf /usr/local/etc/php-fpm.d/zz-docker.conf

FROM fpm-dev AS caddy-dev
RUN apk add yarn
CMD ["caddy", "run", "--config", "/usr/local/etc/Caddyfile"]
EXPOSE 80
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY ./Caddyfile /usr/local/etc/Caddyfile

FROM caddy-dev AS caddy-amqp-dev
RUN install-php-extensions amqp

FROM caddy-dev AS caddy-grpc-dev
RUN install-php-extensions grpc
COPY --link ./conf.d/max_allowed_stack.ini /usr/local/etc/php/conf.d/max_allowed_stack.ini

FROM caddy-dev AS caddy-redis-dev
RUN install-php-extensions redis

FROM caddy-grpc-dev AS caddy-amqp-grpc-dev
RUN install-php-extensions amqp

FROM caddy-grpc-dev AS caddy-redis-grpc-dev
RUN install-php-extensions redis


FROM cli AS cli-prod
RUN install-php-extensions opcache
COPY --link ./php-fpm.d/zz-docker.prod.conf /usr/local/etc/php-fpm.d/zz-docker.conf

FROM cli-prod AS grpc-prod
RUN install-php-extensions grpc
COPY --link ./conf.d/max_allowed_stack.ini /usr/local/etc/php/conf.d/max_allowed_stack.ini

FROM grpc-prod AS amqp-grpc-prod
RUN install-php-extensions amqp

FROM cli-prod AS redis-prod
RUN install-php-extensions redis

FROM grpc-prod AS redis-grpc-prod
RUN install-php-extensions redis


FROM fpm AS fpm-prod
RUN install-php-extensions opcache
COPY --link ./php-fpm.d/zz-docker.prod.conf /usr/local/etc/php-fpm.d/zz-docker.conf

FROM fpm-prod AS caddy-prod
CMD ["caddy", "run", "--config", "/usr/local/etc/Caddyfile"]
EXPOSE 80
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY ./Caddyfile /usr/local/etc/Caddyfile

FROM fpm-prod AS amqp-prod
RUN install-php-extensions amqp

FROM caddy-prod AS caddy-amqp-prod
RUN install-php-extensions amqp

FROM caddy-prod AS caddy-grpc-prod
RUN install-php-extensions grpc
COPY --link ./conf.d/max_allowed_stack.ini /usr/local/etc/php/conf.d/max_allowed_stack.ini

FROM caddy-prod AS caddy-redis-prod
RUN install-php-extensions redis

FROM caddy-grpc-prod AS caddy-amqp-grpc-prod
RUN install-php-extensions amqp

FROM caddy-grpc-prod AS caddy-redis-grpc-prod
RUN install-php-extensions redis