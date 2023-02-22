# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/send_to_signup
  def send_to_signup
    user = User.second
    UserMailer.send_to_signup(user)
  end

end
