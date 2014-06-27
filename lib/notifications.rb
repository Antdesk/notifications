require "notifications/version"

%w{ models }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.autoload_paths << path
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
end

module Notifications
  def notify_random(para)
    self.class.notify_observers :after_random, { action: self, para: para}
  end

  def create_notification
    user = Hash.new
    user[:email] = "adrian.toczydlowski@gmail.com"
    Mailer.create_notification(user).deliver
  end

end
