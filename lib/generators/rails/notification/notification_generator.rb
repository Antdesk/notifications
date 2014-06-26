require 'rails/generators/active_record'

module Rails
  module Generators
    class NotificationGenerator < Base #metagenerator
      argument :model_name, :type => :string
      class_option :create, :type => :boolean, :default => false, :description => "Add create action"
      class_option :update, :type => :boolean, :default => false, :description => "Add update action"
      class_option :destroy, :type => :boolean, :default => false, :description => "Add destroy action"
      class_option :random, :type => :boolean, :default => false, :description => "Add random action"
      #hook_for :orm, :required => true
      source_root File.expand_path("../templates", __FILE__)

      def add_my_initializer
        template 'initializer.rb', 'config/initializers/notifications_initializer.rb'
      end

      def add_observer
        line = "_observer"
        gsub_file 'config/initializers/notifications_initializer.rb', /(#{Regexp.escape(line)})/mi do |match|
          "#{match},:#{file_name}_observer"
        end
      end

      def create_observer_file
        template 'notification.rb', File.join('app/models', "#{file_name}_observer.rb")
      end

      private
      def file_name
        model_name.underscore
      end
    end
  end
end
