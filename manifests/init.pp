# == Class: git
#
# This class installs the git-core package and a global gitconfig file.
#
# === Parameters
#
# [*version*]
#   The version of the package to install. Takes the same arguments as the
#   'ensure' parameter. Defaults to 'present'.
#
# === Examples
#
#   class { 'git': }
#
class git($version = present) {
  package { 'git-core':
    ensure => $version,
  }

  file { '/etc/gitconfig':
    source  => 'puppet:///modules/git/gitconfig',
    require => Package['git-core'],
  }
}