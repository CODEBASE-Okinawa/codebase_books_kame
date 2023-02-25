# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/send_to_signup
  def send_to_signup
    user = User.second
    UserMailer.send_to_signup(user)
  end

  def remind_return_date
    lending = Lending.first
    user = lending.user
    UserMailer.with(
      to: user.email,
      return_date: lending.return_date,
      title: lending.book.title,
      image: lending.book.image.variant(:display).blob.filename
    ).remind_return_date
  end

end
