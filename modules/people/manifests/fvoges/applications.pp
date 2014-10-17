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
  #  include istatmenus4
  #include iterm2::dev
  include iterm2::stable
  include java
  include lastpass
  include omnifocus
  include omnigraffle::pro
  include python
  include quicksilver
  include skype
  include spotify
  include steam
  #include tunnelblick::beta
  include tunnelblick::beta
  include vagrant
  include virtualbox
  include vlc
  include vmware_fusion
#include vim
#include onepassword
#include rdio
#include sizeup

# For the latest build of v3
  include sublime_text
  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

#  vagrant::plugin { 'vagrant-vmware-fusion':
#    license => "/Users/${::luser}/Dropbox/Config/Vagrant/fusion-6-license.lic";
#  }

  homebrew::tap { 'homebrew/dupes': }
  homebrew::tap { 'homebrew/binary': }


  package { [
    'apg',
    'awscli',
    'bash-completion',
    'bundler-completion',
    'ccze',
    'colordiff',
    'coreutils',
    'ec2-api-tools',
    'git-extras',
    'git-flow',
    'graphviz',
    'htop-osx',
    'imagemagick',
    'ipcalc',
    'lynx',
    'mercurial',
    'midnight-commander',
    'minicom',
    'nmap',
    'packer',
    'pstree',
    'rake-completion',
    'rsync',
    'ruby-completion',
    'tmux',
    'tree',
    'unrar',
    'watch',
    'wget',
    'xorriso',
    ]:
  }

  ruby_gem {
    "gist for $globalruby":
      gem           => 'gist',
      ruby_version  => $globalruby;
    "puppet-lint for $globalruby":
      gem           => 'puppet-lint',
      ruby_version  => $globalruby;
    "rspec-puppet for $globalruby":
      gem           => 'rspec-puppet',
      ruby_version  => $globalruby;
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
      source   => 'http://fpdownload.macromedia.com/get/flashplayer/current/licensing/mac/install_flash_player_13_osx_pkg.dmg';
#    'Omnigraffle':
#      provider => appdmg_eula,
#      source   => 'http://downloads2.omnigroup.com/software/MacOSX/10.8/OmniGraffle-6.0.3.dmg';
#    'iStat Menus 4':
#      provider => compressed_app,
#      source   => 'http://s3.amazonaws.com/bjango/files/istatmenus4/istatmenus4.04.zip';
#    'Pacifist':
#      provider => appdmg,
#      source   => 'http://www.charlessoft.com/pacifist_download/Pacifist_3.0.10.dmg';
    'Github for Mac':
      provider => compressed_app,
      source   => 'https://github-central.s3.amazonaws.com/mac%2FGitHub%20for%20Mac%20111.zip';
#    'Remote Desktop':
#      provider => pkgdmg,
#      source   => "/Users/${::luser}/Dropbox/Software/Remote Desktop/RemoteDesktop.dmg";
#    'SubEthaEdit':
#      provider => compressed_app,
#      source   => 'http://www.codingmonkeys.de/subethaedit/SubEthaEdit.zip';
  }

  # If this fails, it's probably because of this:
  # https://tickets.puppetlabs.com/browse/PUP-1421
  # Aply this patch:
  # https://github.com/puppetlabs/puppet/commit/097e9fdd91d5480e0d80adc78a99cd363855a2de
  # to /opt/boxen/repo/.bundle/ruby/2.0.0/gems/puppet-*/lib/puppet/provider/package/appdmg.rb
  #  package {
  #   'Moom':
  #    provider => appdmg,
  #    source   => "http://manytricks.com/download/moom";
  #}
}
