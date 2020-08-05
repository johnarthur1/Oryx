ARG DEBIAN_FLAVOR
FROM oryx-run-base-${DEBIAN_FLAVOR}

# dependencies required for running "phpize"
# (see persistent deps below)
ENV PHPIZE_DEPS \
		autoconf \
		dpkg-dev \
		file \
		g++ \
		gcc \
		libc-dev \
		make \
		pkg-config \
		re2c

# prevent Debian's PHP packages from being installed
# https://github.com/docker-library/php/pull/542
RUN set -eux; \
	{ \
		echo 'Package: php*'; \
		echo 'Pin: release *'; \
		echo 'Pin-Priority: -1'; \
	} > /etc/apt/preferences.d/no-debian-php \
	# persistent / runtime deps
	apt-get update; \
	apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
		$PHPIZE_DEPS \
		ca-certificates \
		curl \
		xz-utils \
		libzip-dev \
		libpng-dev \
		libjpeg-dev \
		libpq-dev \
		libldap2-dev \
		libldb-dev \
		libicu-dev \
		libgmp-dev \
		libmagickwand-dev \
		libc-client-dev \
		libtidy-dev \
		libkrb5-dev \
		libxslt-dev \
		unixodbc-dev \
		openssh-server \
		vim \
		wget \
		tcptraceroute \
		mariadb-client \
		openssl \
		libedit-dev \
		libsodium-dev \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libonig-dev \
		libcurl4-openssl-dev \
		libldap2-dev \
		zlib1g-dev \
		apache2-dev \
		libsqlite3-dev \
	; \
	rm -rf /var/lib/apt/lists/*