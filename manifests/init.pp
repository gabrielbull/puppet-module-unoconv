class unoconv () {
  package {"libreoffice":
    ensure => "present",
  }
  package {"libreoffice-headless":
    ensure => "present",
  }
  package {"libreoffice-sdk":
    ensure => "present",
  }
  exec { "download_unoconv":
    path   => "/usr/bin:/usr/sbin:/bin",
    command => "curl https://codeload.github.com/dagwieers/unoconv/tar.gz/0.6 | tar -xz",
    require => [
      Package['libreoffice'],
      Package['libreoffice-headless'],
      Package['libreoffice-sdk'],
    ],
    notify => Exec["install_unoconv"],
  }
  exec { "install_unoconv":
    path   => "/usr/bin:/usr/sbin:/bin",
    command => "make install --directory=unoconv-0.6",
    require => Exec["download_unoconv"],
  }
}