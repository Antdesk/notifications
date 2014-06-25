class BirdObserver < ActiveRecord::Observer
  def after_create(bird)
    Rails.logger.warn('create')
    Rails.logger.warn(bird)
  end
end
