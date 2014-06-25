module Rails
  module Generators
    class NotificationGenerator < Base #metagenerator
      hook_for :orm, :required => true
      check_class_collision :suffix => "Observer"
      source_root File.expand_path("../templates", __FILE__)

      def add_my_initializer
        template 'initializer.rb', 'config/initializers/notifications_initializer.rb'
      end

      def create_observer_file
        template 'notification.rb', File.join('app/models', class_path, "virtual_machine_observer.rb")
      end
    end
  end
end