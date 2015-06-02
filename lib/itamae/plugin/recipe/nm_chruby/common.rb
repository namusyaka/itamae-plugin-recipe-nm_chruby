node[:nm_chruby] ||= {}

packages = []
packages << 'gcc'
packages << 'git'

case node[:platform]
when %r(debian|ubuntu)
  packages << 'build-essential'
  packages << 'libffi-dev'
  packages << 'libgdbm-dev'
  packages << 'libncurses5-dev'
  packages << 'libreadline6-dev'
  packages << 'libssl-dev'
  packages << 'libyaml-dev'
  packages << 'zlib1g-dev'
when %r(redhat|fedora)
  packages << 'automake'
  packages << 'gdbm-devel'
  packages << 'libffi-devel'
  packages << 'libyaml-devel'
  packages << 'openssl-devel'
  packages << 'ncurses-devel'
  packages << 'readline-devel'
  packages << 'zlib-devel'
end

packages.each { |package_name| package package_name }
