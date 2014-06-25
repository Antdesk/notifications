require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class ObserverGenerator < Base
      check_class_collision :suffix => "Observer"

      source_root File.expand_path("../templates", __FILE__)

      def create_observer_file
        template 'notification.rb', File.join('app/models', class_path, "virtual_machine_observer.rb")
      end

    end
  end
end
