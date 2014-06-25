require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class NotificationGenerator < Base
      check_class_collision :suffix => "Observer"

      source_root File.expand_path("../templates", __FILE__)

      def add_my_initializer
        template 'initializer.rb', 'config/initializers/notifications_initializer.rb'
      end

    end
  end
end