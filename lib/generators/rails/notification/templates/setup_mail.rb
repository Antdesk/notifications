ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "onestepcloud.com",
    :user_name => "actionmailer2014@gmail.com",
    :password => "actionmailer1234",
    :authentication => "plain",
    :enable_starttls_auto => true
}