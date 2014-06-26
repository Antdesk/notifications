class VirtualMachineObserver < ActiveRecord::Observer
  def after_create(virtual_machine)
    Rails.logger.warn('create')
    Rails.logger.warn(bird)
  end
end
