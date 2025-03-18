.SUFFIXES:
	.SILENT

.PHONY: build-56-caddy build-83-caddy build-83-grpc help

help:
	@echo "Available targets:"
	@echo "  build-56-caddy            Build the Docker image for PHP 5.6 Caddy."
	@echo "  build-83-caddy            Build the Docker image for PHP 8.3 Caddy."
	@echo "  build-83-caddy-amqp       Build the Docker image for PHP 8.3 Caddy Amqp."
	@echo "  build-83-caddy-grpc       Build the Docker image for PHP 8.3 Caddy Grpc."
	@echo "  build-83-caddy-grpc-amqp  Build the Docker image for PHP 8.3 Caddy Grpc."
	@echo "  build-83-grpc             Build the Docker image for PHP 8.3 Grpc."
	@echo "  build-83-grpc-amqp        Build the Docker image for PHP 8.3 Grpc Amqp."

all: help

build-56-caddy:
	docker build -t php56-caddy:dev --target dev PHP56-Caddy/
build-83-caddy:
	docker build -t php83-caddy:dev --target dev PHP83-Caddy/
build-83-caddy-amqp:
	docker build -t php83-caddy-amqp:dev --target dev PHP83-Caddy-Amqp/
build-83-caddy-grpc:
	docker build -t php83-caddy-grpc:dev --target dev PHP83-Caddy-Grpc/
build-83-caddy-grpc-amqp:
	docker build -t php83-caddy-grpc-amqp:dev --target dev PHP83-Caddy-Grpc-Amqp/
build-83-grpc:
	docker build -t php83-grpc:dev --target dev PHP83-Grpc/
build-83-grpc-amqp:
	docker build -t php83-grpc-amqp:dev --target dev PHP83-Grpc-Amqp/
