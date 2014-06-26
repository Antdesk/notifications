class <%= class_name %>Observer < ActiveRecord::Observer
  <% if options.create? %>
    def after_create(para)
      Rails.logger.warn('create')
      Rails.logger.warn(para)
    end
  <% end %>
  <% if options.update? %>
    def after_update(para)
      Rails.logger.warn('update')
      Rails.logger.warn(para)
    end
  <% end %>
  <% if options.destroy? %>
    def after_destroy(para)
      Rails.logger.warn('destroy')
      Rails.logger.warn(para)
    end
  <% end %>
  <% if options.random? %>
    def after_random(para)
      Rails.logger.warn('random')
      Rails.logger.warn(para)
    end
  <% end %>
end