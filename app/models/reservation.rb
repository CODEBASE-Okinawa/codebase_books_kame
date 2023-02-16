class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, presene: true
  validates :book_id, presene: true

end
