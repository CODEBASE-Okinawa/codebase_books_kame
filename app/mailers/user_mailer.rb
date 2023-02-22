class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_to_signup.subject
  #
  def send_to_signup(user)
    @user = user
    mail(
      subject: "会員登録が完了しました。", #メールのタイトル
      to: @user.email #宛先
    )
  end
end
