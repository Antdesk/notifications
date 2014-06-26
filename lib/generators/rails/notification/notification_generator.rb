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

      def add_gem_to_gemfile
        gem 'rails-observers'
      end

      def add_my_initializer
        copy_file 'initializer.rb', 'config/initializers/notifications_initializer.rb'
        copy_file 'setup_mail.rb', 'config/initializers/setup_mail.rb'
      end

      def add_random_notification
        if options.random?
          include = false
          line = "include Notifications"
          gsub_file "app/models/#{file_name}.rb", /(#{Regexp.escape(line)})/mi do |match|
            include = true
            "#{match}"
          end
          if include == false
            line = "class #{class_name} < ActiveRecord::Base"
            gsub_file "app/models/#{file_name}.rb", /(#{Regexp.escape(line)})/mi do |match|
              "#{match}\n \tinclude Notifications\n\tdef notify(para)\n\t\tnotify_random(para)\n\tend"
            end
          end
        end
      end

      def add_observer
        include = false
        line = ":#{file_name}_observer"
        gsub_file 'config/initializers/notifications_initializer.rb', /(#{Regexp.escape(line)})/mi do |match|
          include = true
          "#{match}"
        end
        if include == false
          line = "_observer;"
          gsub_file 'config/initializers/notifications_initializer.rb', /(#{Regexp.escape(line)})/mi do |match|
            "_observer,:#{file_name}_observer;"
          end
        end
      end

      def add_first_observer
        line = "#test"
        gsub_file 'config/initializers/notifications_initializer.rb', /(#{Regexp.escape(line)})/mi do |match|
          "config.active_record.observers = :#{file_name}_observer;"
        end
      end

      def create_observer_file
        copy_file 'notification.rb', File.join('app/models', "#{file_name}_observer.rb")
      end

      private
      def file_name
        model_name.underscore
      end

      def class_name
        model_name.camelize.constantize
      end
    end
  end
end
