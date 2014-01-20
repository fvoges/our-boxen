# vim: set et ts=2 sw=2:
class people::fvoges::applications (
    $my_homedir   = $people::fvoges::params::my_homedir,
    $my_sourcedir = $people::fvoges::params::my_sourcedir,
    $my_username  = $people::fvoges::params::my_username,
    $my_email     = $people::fvoges::params::my_email
    ) inherits people::fvoges::params {

  $globalruby = $people::fvoges::globalruby

  include adium
  include appcleaner
  include caffeine
  include chrome
  include dropbox
  include firefox
  include googledrive
  include gpgtools
  include hub
  include istatmenus4
  include iterm2::dev
  include java
  include lastpass
  include omnifocus
  include omnigraffle::pro
  include python
  include skype
  include spotify
  include steam
  include tunnelblick::beta
  include vagrant
  include virtualbox
  include vlc
  include vmware_fusion
#include vim
#include onepassword
#include rdio
#include sizeup

#  vagrant::plugin { 'vagrant-vmware-fusion':
#    license => "/Users/${::luser}/Dropbox/Config/Vagrant/fusion-6-license.lic";
#  }

  package { [
    'apg',
    'graphviz',
    'htop-osx',
    'mc',
    'pstree',
    'tmux',
    'tree',
    'watch',
    'wget',
    ]:
  }

  ruby::gem {
    "gist for $globalruby":
      gem     => 'gist',
      ruby    => $globalruby;
    "puppet-lint for $globalruby":
      gem     => 'puppet-lint',
      ruby    => $globalruby;
    "rspec-puppet for $globalruby":
      gem     => 'rspec-puppet',
      ruby    => $globalruby;
  }

  python::pip { 'awscli':
    virtualenv => $python::config::global_venv,
  }

  package {
    'NoSleep':
      provider => pkgdmg,
      source   => 'https://macosx-nosleep-extension.googlecode.com/files/NoSleep-1.3.3.dmg';
    'GoogleVoiceAndVideoSetup':
      provider => pkgdmg,
      source   => 'http://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg';
    'Adobe Lightroom':
      provider => pkgdmg,
      source   => 'http://download.adobe.com/pub/adobe/lightroom/mac/5.x/Lightroom_5_LS11_mac_5_2.dmg';
    'Adobe Flash':
      provider => 'pkgdmg',
      source   => 'http://fpdownload.macromedia.com/get/flashplayer/current/licensing/mac/install_flash_player_11_osx_pkg.dmg';
#    'Omnigraffle':
#      provider => appdmg_eula,
#      source   => 'http://downloads2.omnigroup.com/software/MacOSX/10.8/OmniGraffle-6.0.3.dmg';
#    'iStat Menus 4':
#      provider => compressed_app,
#      source   => 'http://s3.amazonaws.com/bjango/files/istatmenus4/istatmenus4.04.zip';
    'Pacifist':
      provider => appdmg,
      source   => 'http://www.charlessoft.com/pacifist_download/Pacifist_3.0.10.dmg';
    'Github for Mac':
      provider => compressed_app,
      source   => 'https://github-central.s3.amazonaws.com/mac%2FGitHub%20for%20Mac%20111.zip';
#    'Remote Desktop':
#      provider => pkgdmg,
#      source   => "/Users/${::luser}/Dropbox/Software/Remote Desktop/RemoteDesktop.dmg";
    'SubEthaEdit':
      provider => compressed_app,
      source   => 'http://www.codingmonkeys.de/subethaedit/SubEthaEdit.zip';
  }

  # If this fails, it's probably because of this:
  # https://tickets.puppetlabs.com/browse/PUP-1421
  # Aply this patch:
  # https://github.com/puppetlabs/puppet/commit/097e9fdd91d5480e0d80adc78a99cd363855a2de
  # to /opt/boxen/repo/.bundle/ruby/2.0.0/gems/puppet-*/lib/puppet/provider/package/appdmg.rb
  package {
    'Moom':
      provider => appdmg,
      source   => "http://manytricks.com/download/moom";
  }
}
