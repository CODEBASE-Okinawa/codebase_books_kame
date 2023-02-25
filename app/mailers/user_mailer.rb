class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_to_signup.subject
  #

  # 新規登録時のメール
  def send_to_signup(user)
    @user = user
    mail(
      subject: "会員登録が完了しました。", #メールのタイトル
      to: @user.email #宛先
    )
  end

  # 返却期限1日前のメール
  def remind_return_date
    attachments.inline['image'] = File.read('app/assets/images/'+ params[:image].to_s)
    to = params[:to]
    @return_date = params[:return_date].to_s
    @title = params[:title]
    mail(
      to: to,
      subject: '貸し出し本、返却期限1日前'
    )
  end
end
