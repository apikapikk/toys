FROM php:8.1-apache

# Install dependensi system dan ekstensi PHP
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install gd intl zip mysqli pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Salin source code ke container
COPY . /app

WORKDIR /app

# Install dependency PHP
RUN composer install --no-dev --optimize-autoloader

# Expose port
EXPOSE 8080

# Jalankan built-in server
CMD ["php", "spark", "serve", "--host", "0.0.0.0", "--port", "8080"]
