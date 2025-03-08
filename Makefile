.SUFFIXES:
	.SILENT

.PHONY: build-56-caddy build-83-caddy build-83-grpc help

help:
	@echo "Available targets:"
	@echo "  build-56-caddy     Build the Docker image for PHP 5.6 Caddy."
	@echo "  build-83-caddy     Build the Docker image for PHP 8.3 Caddy."
	@echo "  build-83-grpc      Build the Docker image for PHP 8.3 Grpc."

all: help

build-56-caddy:
	docker build -t php56-caddy:dev --target dev PHP56-Caddy/
build-83-caddy:
	docker build -t php83-caddy:dev --target dev PHP83-Caddy/
build-83-grpc:
	docker build -t php83-grpc:dev --target dev PHP83-Grpc/
