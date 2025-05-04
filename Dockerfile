# Gunakan image PHP resmi dengan Apache
FROM php:8.2-apache

# Install dependensi sistem yang dibutuhkan
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install ekstensi PHP yang diperlukan
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Salin file konfigurasi PHP
COPY php.ini /usr/local/etc/php/

# Set working directory
WORKDIR /var/www/html

# Salin semua file ke container
COPY . /var/www/html

# Install dependensi dari composer
RUN composer install --no-dev --optimize-autoloader

# Set permission folder writable
RUN chown -R www-data:www-data writable && chmod -R 775 writable

# Konfigurasi Apache: aktifkan rewrite module
RUN a2enmod rewrite

# Salin file konfigurasi Apache
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

# Ekspos port 80
EXPOSE 80
