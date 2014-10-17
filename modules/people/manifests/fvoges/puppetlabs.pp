class people::fvoges::puppetlabs (
    $my_homedir   = $people::fvoges::params::my_homedir,
    $my_sourcedir = $people::fvoges::params::my_sourcedir,
    $my_username  = $people::fvoges::params::my_username,
    $my_email     = $people::fvoges::params::my_email
    ){

  include hipchat

  $src = "${boxen::config::srcdir}"
  $globalruby = $people::fvoges::globalruby

  repository {
    "${src}/puppet":
      source => 'puppetlabs/puppet';
    "${src}/facter":
      source => 'puppetlabs/facter';
  }

  ruby_gem { "showoff for $globalruby":
    gem          => 'showoff',
    ruby_version => "$globalruby",
    version      => '>= 0.9.7';
  }

  file { '/usr/local/bin/envpuppet':
    target  => "$src/puppet/ext/envpuppet",
    require => [ Repository["$src/puppet"], File['/usr/local/bin'] ];
  }

}
