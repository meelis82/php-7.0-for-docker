class build::php70::extensions::imap {
  file { '/tmp/imap-2007f.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/imap-2007f.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf imap-2007f.tar.gz':
    require => File['/tmp/imap-2007f.tar.gz']
  }
}
