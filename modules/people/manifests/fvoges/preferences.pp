class people::fvoges::preferences (
    $my_homedir   = $::people::fvoges::params::my_homedir,
    $my_sourcedir = $::people::fvoges::params::my_sourcedir,
    $my_username  = $::people::fvoges::params::my_username,
    $my_email     = $::people::fvoges::params::my_email
  ){

  osx::recovery_message { "If found, please email ${my_email}": }

  include osx::global::disable_remote_control_ir_receiver

#  include osx::dock::clear_dock
#  include osx::dock::autohide
#  include osx::dock::disable

  include osx::finder::unhide_library

  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update

  include osx::global::expand_save_dialog
  include osx::universal_access::ctrl_mod_zoom

  class { 'osx::global::key_repeat_delay':
    delay => 15,
  }
  class { 'osx::global::key_repeat_rate':
    rate => 2,
  }

  boxen::osx_defaults {
    'Globally Disable Autocorrect':
      user   => "${::boxen_user}",
      key    => 'NSAutomaticSpellingCorrectionEnabled',
      domain => 'NSGlobalDomain',
      value  => '0';
    'Disable Dashboard':
      user   => "${::boxen_user}",
      key    => 'mcx-disabled',
      domain => 'com.apple.dashboard',
      value  => '1';
    'Stop Preview re-opening documents':
      domain => 'com.apple.Preview',
      key    => 'NSQuitAlwaysKeepsWindows',
      value  => 'NO';
    'Prevent Time Machine from prompting to use new hard drives as backup volume':
      key    => 'DoNotOfferNewDisksForBackup',
      domain => 'com.apple.TimeMachine',
      value  => 'true',
      type   => 'bool',
      user   => $::boxen_user;
    'Finder Status Bar':
      domain => 'com.apple.finder',
      key    => 'ShowStatusBar',
      value  => 'YES';
    'Enable NetaTalk for Time Machine':
      domain => 'com.apple.systempreferences',
      key    => 'TMShowUnsupportedNetworkVolumes',
      value  => '1';
    #'Lower Left Hot Corner: Start Screen Saver':
    #  user   => "${::boxen_user}",
    #  key    => 'wvous-bl-corner',
    #  domain => 'com.apple.dock',
    #  value  => '5',
    #  notify => Exec['killall Dock'];
    #'Lower Left Hot Corner: Start Screen Saver modifier':
    #  user   => "${::boxen_user}",
    #  key    => 'wvous-bl-modifier',
    #  domain => 'com.apple.dock',
    #  value  => '0',
    #  notify => Exec['killall Dock'];
  }
}
