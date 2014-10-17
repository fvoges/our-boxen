class people::fvoges {

  $globalruby = '2.0.0'

  #  class { 'ruby::global':
  #  version => "$globalruby"
  #}

  include people::fvoges::applications
  include people::fvoges::dock
  include people::fvoges::dotfiles
  include people::fvoges::gitconfig
  include people::fvoges::params
  include people::fvoges::preferences
  include people::fvoges::puppetlabs
}
