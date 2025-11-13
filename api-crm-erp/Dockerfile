# 1. Usar una imagen base de PHP 8.2
FROM php:8.2-cli

# 2. Instalar TODAS las dependencias y extensiones de PHP en un solo paso
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libzip-dev \
    libgd-dev \
    libxml2-dev \
    libonig-dev \
    && docker-php-ext-install pdo pdo_mysql zip gd mbstring xml dom simplexml fileinfo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 3. Instalar Composer (el gestor de paquetes de PHP)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Establecer el directorio de trabajo
WORKDIR /var/www

# 5. Copiar TODO el código de la aplicación
COPY . .

# 6. Ejecutar la instalación completa de Composer
# Esto descargará paquetes Y ejecutará los scripts como 'package:discover'
RUN composer install --optimize-autoloader

# 7. Asegurar permisos correctos para Laravel
RUN chown -R www-data:www-data \
    storage \
    bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache

# 8. Exponer el puerto de 'artisan serve'
EXPOSE 8067

# 9. Comando para iniciar el servidor de Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8067"]