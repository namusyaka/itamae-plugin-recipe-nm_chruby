include_recipe './resource.rb'
include_recipe './common.rb'

CHRUBY_ROOT ||= '/usr/local/chruby'

chruby_install CHRUBY_ROOT
