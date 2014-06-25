<% module_namespacing do -%>
class <%= class_name %>Observer < ActiveRecord::Observer
  def after_create(virtual_machine)
    Rails.logger.warn('create')
    Rails.logger.warn(bird)
  end
end
<% end %>
