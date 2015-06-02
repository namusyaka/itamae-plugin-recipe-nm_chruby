define :chruby_install, user: nil do
  params = self.params

  git params[:name] do
    repository "https://github.com/postmodern/chruby.git"
    user params[:user] if params[:user]
  end

  execute "setup.sh" do
    command "cd #{params[:name]}; sh scripts/setup.sh"
    user params[:user] if params[:user]
  end

  ruby_install_path = "#{params[:name]}/ruby-install"

  git ruby_install_path do
    repository "https://github.com/postmodern/ruby-install.git"
    user params[:user] if params[:user]
  end

  execute "make install" do
    command "cd #{ruby_install_path}; sudo make install"
  end
end
