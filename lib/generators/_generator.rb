class InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  # all public methods in here will be run in order
  def add_my_initializer
    template "initializer.rb", "config/initializers/notifications_initializer.rb"
  end
end