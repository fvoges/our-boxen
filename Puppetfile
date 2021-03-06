# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.7.0"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.1"
github "go",          "2.1.0"
github "homebrew",    "1.9.8"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.4"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.7"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",      "1.4.0"
github "appcleaner", "1.0.0"
github "caffeine",   "1.0.0"
github "chrome",     "1.2.0"
#github "dockutil",   "0.1.2", :repo => "grahamgilbert/puppet-dockutil"
github "dockutil",   "0.2.1"
github "dropbox",    "1.4.0"
github "firefox",    "1.2.3"
github "googledrive", "1.0.2"
github "gpgtools",   "0.0.4", :repo => "gaahrdner/puppet-gpgtools"
github "hipchat",    "1.1.3"
#github "istatmenus4", "1.0.0"
github "iterm2",     "1.2.2"
github "java",       "1.7.0"
github "lastpass",	 "1.1.0", :repo => "dieterdemeyer/puppet-lastpass"
github "omnigraffle", "1.3.1"
github "omnifocus",  "1.0.1"
#github "onepassword", "1.1.0"
github "osx",        "2.7.1"
github "python",     "2.0.0"
#github "rdio",       "1.0.0"
github "sizeup",     "1.0.0"
github "skype",      "1.0.9"
github "spotify",    "1.0.2"
github "steam",      "1.0.1"
github "sublime_text", "1.0.1"
github "tunnelblick", "1.0.7"
github "vagrant",    "3.2.0"
github "vim",        "1.0.5"
github "virtualbox", "1.0.9"
github "vlc",        "1.1.0"
github "vmware_fusion", "1.2.0"
github "quicksilver", "1.3.0"
