# == Class: telegraf::inputs::net
#
# Manage the "net" input:
#
class telegraf::inputs::net (
  $drop          = undef,
  $ensure        = present,
  $interval      = undef,
  $name_override = undef,
  $name_prefix   = undef,
  $name_suffix   = undef,
  $pass          = undef,
  $tagdrop       = undef,
  $tagpass       = undef,
  $tags          = undef,
  $interfaces    = undef,
){

  if $ensure == 'present' {
    file { "${::telegraf::config_directory}/inputs-net.conf":
      ensure  => file,
      content => template('telegraf/inputs/net.conf.erb'),
      mode    => '0444',
      owner   => 'root',
      group   => 'telegraf',
      notify  => Service['telegraf'];
    }
  } else {
    file { "${::telegraf::config_directory}/inputs-net.conf":
      ensure => absent,
      notify => Service['telegraf'],
    }
  }

}
