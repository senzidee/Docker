.SUFFIXES:
	.SILENT

.PHONY: help

help:
	@echo "Available targets:"
	@echo "  build-56-caddy            Build the Docker image for PHP 5.6 with Caddy."
	@echo "  build-83-caddy            Build the Docker image for PHP 8.3 with Caddy."
	@echo "  build-83-caddy-amqp       Build the Docker image for PHP 8.3 with Caddy & Amqp."
	@echo "  build-83-caddy-grpc       Build the Docker image for PHP 8.3 with Caddy & Grpc."
	@echo "  build-83-caddy-grpc-amqp  Build the Docker image for PHP 8.3 with Caddy, Grpc & Amqp."
	@echo "  build-83-grpc             Build the Docker image for PHP 8.3 with Grpc."
	@echo "  build-83-grpc-amqp        Build the Docker image for PHP 8.3 with Grpc & Amqp."
	@echo "  build-84-all              Build all Docker images for PHP 8.4"
	@echo "  build-84-cli              Build the Docker image for PHP 8.4"
	@echo "  build-84-caddy            Build the Docker image for PHP 8.4 with Caddy."
	@echo "  build-84-caddy-amqp       Build the Docker image for PHP 8.4 with Caddy & Amqp."
	@echo "  build-84-caddy-grpc       Build the Docker image for PHP 8.4 with Caddy & Grpc."
	@echo "  build-84-caddy-grpc-amqp  Build the Docker image for PHP 8.4 with Caddy, Grpc & Amqp."
	@echo "  build-84-grpc             Build the Docker image for PHP 8.4 with Grpc."
	@echo "  build-84-grpc-amqp        Build the Docker image for PHP 8.4 with Grpc & Amqp."

all: help

build-56-caddy:
	docker build -t ghcr.io/senzidee/docker-php56-caddy:dev --target dev PHP56-Caddy/
build-83-caddy:
	docker build -t ghcr.io/senzidee/docker-php83-caddy:dev --target dev PHP83-Caddy/
build-83-caddy-amqp:
	docker build -t ghcr.io/senzidee/docker-php83-caddy-amqp:dev --target dev PHP83-Caddy-Amqp/
build-83-caddy-grpc:
	docker build -t ghcr.io/senzidee/docker-php83-caddy-grpc:dev --target dev PHP83-Caddy-Grpc/
build-83-caddy-grpc-amqp:
	docker build -t ghcr.io/senzidee/docker-php83-caddy-grpc-amqp:dev --target dev PHP83-Caddy-Grpc-Amqp/
build-83-grpc:
	docker build -t ghcr.io/senzidee/docker-php83-grpc:dev --target dev PHP83-Grpc/
build-83-grpc-amqp:
	docker build -t ghcr.io/senzidee/docker-php83-grpc-amqp:dev --target dev PHP83-Grpc-Amqp/

build-84-all: build-84-cli build-84-amqp build-84-amqp-grpc build-84-redis build-84-redis-grpc build-84-caddy build-84-caddy-amqp build-84-caddy-redis build-83-caddy-grpc build-84-caddy-amqp-grpc build-84-caddy-grpc build-84-caddy-redis-grpc
build-84-cli:
	docker buildx build -t ghcr.io/senzidee/docker-php84-cli:dev --target cli-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache PHP84/
build-84-amqp:
	docker buildx build -t ghcr.io/senzidee/docker-php84-amqp:dev --target amqp-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-amqp-grpc:
	docker buildx build -t ghcr.io/senzidee/docker-php84-amqp-grpc:dev --target amqp-grpc-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-redis:
	docker buildx build -t ghcr.io/senzidee/docker-php84-redis:dev --target redis-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-redis-grpc:
	docker buildx build -t ghcr.io/senzidee/docker-php84-redis-grpc:dev --target redis-grpc-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-caddy:
	docker buildx build -t ghcr.io/senzidee/docker-php84-caddy:dev --target caddy-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-caddy-amqp:
	docker buildx build -t ghcr.io/senzidee/docker-php84-caddy-amqp:dev --target caddy-amqp-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-caddy-grpc:
	docker buildx build -t ghcr.io/senzidee/docker-php84-caddy-grpc:dev --target caddy-grpc-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-caddy-redis:
	docker buildx build -t ghcr.io/senzidee/docker-php84-caddy-redis:dev --target caddy-redis-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-caddy-amqp-grpc:
	docker buildx build -t ghcr.io/senzidee/docker-php84-caddy-amqp-grpc:dev --target caddy-amqp-grpc-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-caddy-grpc:
	docker buildx build -t ghcr.io/senzidee/docker-php84-caddy-grpc:dev --target caddy-grpc-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
build-84-caddy-redis-grpc:
	docker buildx build -t ghcr.io/senzidee/docker-php84-caddy-redis-grpc:dev --target caddy-redis-grpc-dev --cache-to type=local,dest=./.build-cache,mode=max --cache-from type=local,src=./.build-cache  PHP84/
