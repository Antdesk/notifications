module Rails
  module Generators
    class NotificationGenerator < NamedBase #metagenerator
      argument :model_name, :type => :string
      class_option :create, :type => :boolean, :default => false, :description => "Add create action"
      class_option :update, :type => :boolean, :default => false, :description => "Add update action"
      class_option :destroy, :type => :boolean, :default => false, :description => "Add destroy action"
      class_option :random, :type => :boolean, :default => false, :description => "Add random action"
      hook_for :orm, :required => true
      source_root File.expand_path("../templates", __FILE__)

      def add_my_initializer
        template 'initializer.rb', 'config/initializers/notifications_initializer.rb'
      end

=begin
      def create_observer_file
        template 'notification.rb', File.join('app/models', class_path, "virtual_machine_observer.rb") if options.create?
      end
=end
    end
  end
end