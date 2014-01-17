class people::fvoges::applications {

  $globalruby = $people::fvoges::globalruby

  include adium
  include caffeine
  include chrome
  include dropbox
  include gpgtools
  include firefox
  include iterm2::dev
  include lastpass
  #include onepassword
  include java
  include python
  #include rdio
  include sizeup
  include skype
  include tunnelblick::beta
  include vagrant
  include vim
  include virtualbox
  include vlc
  include vmware_fusion
  
  package { [
    'htop-osx',
    'watch',
    'wget',
    'tree',
    'pstree',
    'apg',
    'tmux'
    ]:
  }

  ruby::gem { "gist for $globalruby":
    gem     => 'gist',
    ruby    => "$globalruby";
  }
  
  python::pip { 'awscli':
    virtualenv => $python::config::global_venv,
  }

  package {
    'GoogleVoiceAndVideoSetup':
      source => 'http://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg',
      provider => pkgdmg;
  }
}
