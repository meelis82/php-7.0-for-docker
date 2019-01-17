class clean {

  bash_exec { 'apt-get remove -y $(dpkg -l|grep \'\-dev\'|awk \'{ print $2 }\')': }

  bash_exec { 'apt-get remove -y build-essential autoconf automake':
    require => Bash_exec[ 'apt-get remove -y $(dpkg -l|grep \'\-dev\'|awk \'{ print $2 }\')' ]
  }

  bash_exec { 'apt-get autoremove -y':
    require => Bash_exec[ 'apt-get remove -y build-essential autoconf automake' ]
  }

  bash_exec { 'apt-get clean':
    require => Bash_exec[ 'apt-get autoremove -y' ]
  }

  bash_exec { 'rm -rf /tmp/*': }

  bash_exec { 'rm -rf /var/lib/apt/lists/*': }
}
