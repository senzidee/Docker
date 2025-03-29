# Docker Tools & Configurations

[![License](https://img.shields.io/github/license/senzidee/Docker)](https://github.com/senzidee/Docker/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/senzidee/Docker)](https://github.com/senzidee/Docker/issues)
[![GitHub stars](https://img.shields.io/github/stars/senzidee/Docker)](https://github.com/senzidee/Docker/stargazers)

A curated collection of Docker configurations, tools, and best practices for PHP development environments with a focus
on clean code principles and hexagonal architecture.

## Overview
This repository provides Docker configurations optimized for PHP applications.
The configurations are designed to be modular, maintainable, and follow clean code principles.

## Features

- **Development-ready PHP environments**: Pre-configured Docker containers for PHP development
- **Modular architecture**: Container configurations supporting hexagonal architecture principles
- **Clean separation of concerns**: Each service has a well-defined responsibility
- **Production-ready templates**: Configurations that can be extended for production use
- **Performance optimization**: Docker configurations tuned for optimal performance

## Contents

/PHP56-Caddy: Docker container with Caddy 2.8.4 and PHP 5.6
/PHP83-Caddy: Docker container with Caddy 2.8.4 and PHP 8.3
/PHP83-Caddy-Amqp: Docker container with Caddy 2.8.4, PHP 8.3 and Amqp driver
/PHP83-Caddy-Grpc: Docker container with Caddy 2.8.4, PHP 8.3 and Grpc driver
/PHP83-Caddy-Grpc-Amqp: Docker container with Caddy 2.8.4, PHP 8.3, Grpc and Amqp driver
/PHP83-Grpc: Docker container with PHP 8.3 and Grpc driver
/PHP83-Grpc-Amqp: Docker container with PHP 8.3, Grpc and Amqp driver

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Make](https://www.gnu.org/software/make/manual/make.html)

### Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/senzidee/Docker.git
   cd Docker
   ```

2. Choose a version from the *Contents* above and run:
   ```bash
   make build-83-caddy
   ```

3. Start the containers:
   ```bash
   docker run --rm -d -p 8000:80 -v ./example:/app --name php83 php83-caddy:dev
   ```

4. Access to example application at [http://localhost:8000](http://localhost:8000)

## Hexagonal Architecture Support

The Docker configurations in this repository are designed to support hexagonal architecture principles:

- **Domain Layer**: Isolated environments for business logic
- **Application Layer**: Service containers for application services
- **Infrastructure Layer**: Database, cache, and web server containers

This separation allows for more maintainable applications with clear boundaries between different concerns.

## Customization

### PHP Extensions

Modify the PHP Dockerfile to add or remove extensions as needed:

```dockerfile
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
        @composer \
        amqp \
    	pdo_pgsql \
    	gd \
        grpc \
    	intl \
    	zip
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Docker Documentation](https://docs.docker.com/)
- [PHP Docker Official Images](https://hub.docker.com/_/php)
- The Clean Code principles by Robert C. Martin