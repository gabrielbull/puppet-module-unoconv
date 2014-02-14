class unoconv () {
  exec { "download_unoconv":
    path   => "/usr/bin:/usr/sbin:/bin",
    command => "curl https://codeload.github.com/dagwieers/unoconv/tar.gz/0.6 | tar -xz",
    require => Package['libreoffice'],
    notify => Exec["install_unoconv"],
  }
  exec { "install_unoconv":
    path   => "/usr/bin:/usr/sbin:/bin",
    command => "make install --directory=unoconv-0.6",
    require => Exec["download_unoconv"],
  }
}