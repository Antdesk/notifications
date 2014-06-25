module Rails
  module Generators
    class NotificationGenerator < NamedBase #metagenerator
      hook_for :orm, :required => true
    end
  end
end