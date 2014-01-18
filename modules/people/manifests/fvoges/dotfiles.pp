class people::fvoges::dotfiles {

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${boxen::config::srcdir}/dotfiles"

  repository {
    "$dotfiles":
      source => 'fvoges/puppetlabs-rcfiles';
  }

#  vim::bundle { [
#    'tpope/vim-sensible'
#  ]: }

  file {
    "$home/.tmux.conf":
      target  => "$dotfiles/tmux.conf",
      require => Repository["$dotfiles"];
    "$home/.vim":
      target  => "$dotfiles/vim",
      force   => true,
      require => Repository["$dotfiles"];
    "$home/.vimrc":
      target  => "$dotfiles/vimrc",
      require => Repository["$dotfiles"];
    "$home/.screenrc":
      target  => "$dotfiles/screenrc",
      require => Repository["$dotfiles"];
#    "$home/.inputrc":
#      target  => "$dotfiles/home/.inputrc",
#      require => Repository["$dotfiles"];
#    "$home/.bash_aliases":
#      target  => "$dotfiles/home/.bash_aliases",
#      require => Repository["$dotfiles"];
    "$home/.bashrc":
      target  => "$dotfiles/bashrc",
      require => Repository["$dotfiles"];
#    "$home/.ssh":
#      ensure => directory;
#    "$home/.ssh/config":
#      target  => "$dotfiles/home/.ssh/config",
#      require => [ File["$home/.ssh"], Repository["$dotfiles"] ];
  }

}
