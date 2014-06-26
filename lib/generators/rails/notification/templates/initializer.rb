Rails.application.configure do
  config.active_record.observers = :test
end
#:bird_observer