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
  #include sizeup
  include skype
  include tunnelblick::beta
  include vagrant
#  include vim
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
      source   => 'http://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg',
      provider => pkgdmg;
    'Adobe Lightroom':
      source   => 'http://download.adobe.com/pub/adobe/lightroom/mac/5.x/Lightroom_5_LS11_mac_5_2.dmg',
      provider => pkgdmg;
  }

  # If this fails, it's probably because of this:
  # https://tickets.puppetlabs.com/browse/PUP-1421
  # Aply this patch:
  # https://github.com/puppetlabs/puppet/commit/097e9fdd91d5480e0d80adc78a99cd363855a2de
  # to /opt/boxen/repo/.bundle/ruby/2.0.0/gems/puppet-*/lib/puppet/provider/package/appdmg.rb
  package {
    'Moom':
      source   => "http://manytricks.com/download/moom",
      provider => appdmg;
  }
}
