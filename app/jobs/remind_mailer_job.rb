class RemindMailerJob < ApplicationJob
  queue_as :default

  def perform(lending)
    unless lending.nil?
      user = User.find(lending.user_id)
      book = lending.book
      unless user.nil?
        UserMailer.with(
          to: user.email,
          return_date: lending.return_date,
          title: book.title,
          image: book.image.variant(:display).blob.filename
        ).remind_return_date.deliver_now
      end
    end
  end
end
