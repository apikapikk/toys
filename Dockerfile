# Gunakan image dasar PHP 7.4 dengan Apache
FROM php:7.4-apache

# Install dependensi sistem dan tambahkan repositori backports agar libzip versi kompatibel tersedia
RUN apt-get update && apt-get install -y \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    gnupg2 && \
    echo "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main" >> /etc/apt/sources.list

# Install dependensi untuk ekstensi PHP yang dibutuhkan
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    pkg-config \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        gd \
        intl \
        zip \
        mysqli \
        pdo \
        pdo_mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Aktifkan mod_rewrite untuk Apache (berguna untuk framework seperti Laravel, CodeIgniter, dsb.)
RUN a2enmod rewrite

# Salin semua file project ke folder default Apache
COPY . /var/www/html/

# Set permission
RUN chown -R www-data:www-data /var/www/html

# Ekspos port 80
EXPOSE 80
