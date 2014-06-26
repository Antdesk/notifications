Rails.application.configure do
  config.active_record.observers = :<%=file_name%>_observer
end
