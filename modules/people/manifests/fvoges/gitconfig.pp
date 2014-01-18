class people::fvoges::gitconfig (
    $my_homedir   = $people::fvoges::params::my_homedir,
    $my_sourcedir = $people::fvoges::params::my_sourcedir,
    $my_username  = $people::fvoges::params::my_username,
    $my_email     = $people::fvoges::params::my_email
    ){
  
  git::config::global {
    'user.name':    value => 'Federico Voges';
    'user.email':   value => 'fvoges@gmail.com';
    'color.ui':     value => 'auto';
    'github.user':  value => 'fvoges';
    'push.default': value => 'simple';
    'alias.a':      value => 'add';
    'alias.aa':     value => 'add -A';
    'alias.bv':     value => 'branch -avv';
    'alias.co':     value => 'checkout';
    'alias.c':      value => 'commit';
    'alias.ca':     value => 'commit -a';
    'alias.m':      value => 'commit -m';
    'alias.cam':    value => 'commit -a -m';
    'alias.d':      value => 'diff';
    'alias.ds':     value => 'diff --stat';
    'alias.l':      value => 'log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit --date=relative';
    'alias.l1':     value => 'log --pretty=oneline';
    'alias.s':      value => 'status';
  }
  
}
