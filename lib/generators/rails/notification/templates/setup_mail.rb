ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "onestepcloud.com",
    :user_name => "andrzej.krawczyk1989@gmail.com",
    :password => "krawczyk1234",
    :authentication => "plain",
    :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options[:host] = "localhost:3000"