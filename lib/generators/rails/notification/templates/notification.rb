class <%= argument %>Observer < ActiveRecord::Observer
  def after_create(para)
    Rails.logger.warn('create')
    Rails.logger.warn(para)
  end
end
