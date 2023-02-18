class Book < ApplicationRecord
    has_one_attached :image do |attachable|
        attachable.variant :display, resize_to_limit: [400, 400]
      end
    has_many :lendings
    has_many :reservations
    has_many :users, through: :reservations
    validates :title, presence: true
    validates :author, presence: true

end
