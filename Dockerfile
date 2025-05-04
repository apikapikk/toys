FROM php:8.2-apache

# Install dependensi dari apt
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    git \
    unzip \
    libicu-dev \
    zlib1g-dev \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Install ekstensi PHP
RUN docker-php-ext-install gd intl zip pdo pdo_mysql

# Set ServerName untuk menghindari peringatan Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Salin file konfigurasi Apache
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Salin file aplikasi
COPY . /var/www/html/

# Install dependensi Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install dependensi PHP
RUN composer install --no-dev --optimize-autoloader

# Set permission folder writable
RUN chown -R www-data:www-data /var/www/html

# Ekspos port 80
EXPOSE 80

# Pastikan Apache berjalan
CMD ["apache2-foreground"]
