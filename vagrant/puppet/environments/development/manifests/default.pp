Exec {
    path    => ["/usr/bin", "/bin", "/usr/sbin", "/sbin"],
    timeout => 0,
}

Package {
    require => Exec["apt-get : update"],
    before  => Exec["apt-get : autoremove"],
}

exec { "apt-get : https-update":
    command => "apt-get update",
}

package { "apt-get : https":
    name    => "apt-transport-https",
    require => Exec["apt-get : https-update"],
}

exec { "apt-get : update":
    command => "apt-get update",
    require => Package["apt-get : https"],
}

exec { "apt-get : upgrade":
    command => "apt-get dist-upgrade -y",
    require => Exec["apt-get : update"],
}

exec { "apt-get : autoremove":
    command => "apt-get autoremove -q -y",
    require => Exec["apt-get : upgrade"],
}

package { "vim":
    name => "vim",
}

package { "git":
    name => "git",
}

package { "unzip":
    name => "unzip",
}

exec { "php : key":
    creates => "/etc/apt/trusted.gpg.d/php.gpg",
    command => "wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg",
}

file { "php : list":
    path    => "/etc/apt/sources.list.d/php.list",
    content => "deb https://packages.sury.org/php/ jessie main",
    require => Exec["php : key"],
    before  => Exec["apt-get : update"],
}

package { "php : cli":
    name    => "php-cli",
    require => [
        File["php : list"],
        Exec["apt-get : update"],
    ],
}

exec { "composer : install":
    creates => "/usr/bin/composer",
    command => "wget https://getcomposer.org/composer.phar -O /usr/bin/composer && chmod +x /usr/bin/composer",
}

exec { "composer : upgrade":
    command     => "composer self-update",
    environment => ["HOME=/root"],
    require     => [
        Package["php : cli"],
        Exec["composer : install"],
    ],
}
