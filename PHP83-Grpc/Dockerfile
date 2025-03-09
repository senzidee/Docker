FROM php:8.3.17-cli-alpine AS base
RUN apk --no-cache add bash patch unzip zip zlib
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
        @composer \
    	pdo_pgsql \
    	gd \
        grpc \
    	intl \
    	zip

ARG COMPOSER_FLAGS="--no-interaction --no-progress --ansi"
ENV COMPOSER_ALLOW_SUPERUSER=1

COPY --link ./conf.d/max_allowed_stack.ini /usr/local/etc/php/conf.d/max_allowed_stack.ini

WORKDIR /app
EXPOSE 80

FROM base AS dev
RUN install-php-extensions xdebug
COPY --link ./conf.d/xdebug.ini /usr/local/etc/conf.d/xdebug.ini
COPY --link ./conf.d/error_reporting.dev.ini /usr/local/etc/conf.d/error_reporting.ini

FROM base AS prod
ENV APP_ENV=prod
RUN install-php-extensions opcache