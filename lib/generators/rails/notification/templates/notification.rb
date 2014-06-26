class <%= class_name %>Observer < ActiveRecord::Observer
  <% if options.create? %>
    def after_create(para)
      Rails.logger.warn('create')
      Rails.logger.warn(para)
    end
  <% end %>
end
