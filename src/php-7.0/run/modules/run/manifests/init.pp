class run {
  require run::user

  include run::php70
  include run::smtp
  include run::drush
  include run::coder
  include run::phpcs
  include run::timezone

  if $crontab_1_expression and $crontab_1_command {
    include run::cron
  }

  if $mysql_host {
    include run::mysql
  }

  if $memcached_host {
    include run::memcached
  }

  if $redis_host {
    include run::redis
  }

  file { '/home/container/.bashrc':
    ensure => present,
    content => template('run/.bashrc.erb'),
    mode => 644
  }
}
