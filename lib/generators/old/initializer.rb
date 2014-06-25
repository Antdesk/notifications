Rails.application.configure do
  config.active_record.observers = :bird_observer
end