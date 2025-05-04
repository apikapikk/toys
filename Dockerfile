FROM php:8.2-cli

# Install needed extensions
RUN apt-get update && apt-get install -y unzip \
    && docker-php-ext-install pdo pdo_mysql opcache

# Set preload di php.ini
COPY php.ini /usr/local/etc/php/php.ini

# Copy source code
WORKDIR /app
COPY . .

# Install dependencies
RUN composer install

# Set permission
RUN chmod -R 755 /app/writable

# Expose port for spark serve
EXPOSE 8080

# Start CI server
CMD ["php", "spark", "serve", "--host", "0.0.0.0", "--port", "8080"]
