require "notifications/version"

%w{ models }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.autoload_paths << path
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
end

module Notifications
  def self.notification
    "notifications"
  end
  class Application < Rails::Application
    config.active_record.observers = :bird_observer
  end
end
