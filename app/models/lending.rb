class Lending < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true

  private
    def return_date_remindmail
      RemindMailerJob.set(wait_until: remind_day).perform_later(self)
    end

    def remind_day
      self.return_date - 2.day - 15.hour
    end
end
