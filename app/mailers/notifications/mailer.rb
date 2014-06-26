class Notifications::Mailer < ActionMailer::Base
  default :from => 'no-replay@onestepcloud.com'

  def create_notification(user)
    mail(:to => user.email, :subject => 'Machine created')
  end

end