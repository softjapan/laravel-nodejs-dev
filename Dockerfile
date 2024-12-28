FROM php:8.2-fpm

# ---- 1. 必要パッケージ・拡張をインストール ----
# zip拡張をビルドするための libzip-dev、unzip、git 等も一括インストール
RUN apt-get update \
    && apt-get install -y \
       curl \
       gnupg \
       ca-certificates \
       lsb-release \
       software-properties-common \
       git \
       libzip-dev \
       zip \
       unzip \
    && docker-php-ext-install zip \
    && curl -fsSL https://deb.nodesource.com/setup_current.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ---- 2. Composer をインストール ----
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

# ---- 3. Laravel Installer をグローバルインストール ----
# インストール失敗時のログを確認しやすいよう "-vvv" を付けてもよいです
RUN composer global require laravel/installer

# ---- 4. laravel コマンドへのパスを通す ----
# 新しい Composer では /root/.config/composer/vendor/bin に
# インストールされるケースもあるため、両方追加しておくと安心です
ENV COMPOSER_HOME=/root/.composer
ENV PATH="/root/.composer/vendor/bin:/root/.config/composer/vendor/bin:${PATH}"

# 作業ディレクトリ
WORKDIR /app

# エントリーポイント (php-fpm イメージの既定スクリプトを利用)
ENTRYPOINT ["docker-php-entrypoint"]

# デフォルトコマンド: php-fpm
CMD ["php-fpm"]