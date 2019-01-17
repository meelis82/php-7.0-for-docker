class build::php70::packages {
  package {[
      'build-essential',
      'libxml2-dev',
      'libssl-dev',
      'libzip-dev',
      'libbz2-dev',
      'libcurl4-openssl-dev',
      'libjpeg-dev',
      'libpng-dev',
      'libmcrypt-dev',
      'libmhash-dev',
      'libmariadbclient-dev-compat',
      'libpspell-dev',
      'autoconf',
      'libcloog-ppl1',
      'libsasl2-dev',
      'libldap2-dev',
      'pkg-config',
      'libpq-dev',
      'libreadline-dev',
      'libfreetype6-dev',
      'imagemagick',
    ]:
    ensure => present
  }
}
