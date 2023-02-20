class Book < ApplicationRecord
    has_one_attached :image do |attachable|
        attachable.variant :display, resize_to_limit: [400, 400]
      end
   
    has_many :users_lendings, through: :lendings, source: :book
    has_many :users_reservations, through: :reservations, source: :book
    validates :title, presence: true
    validates :author, presence: true

end
