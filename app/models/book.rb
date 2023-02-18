class Book < ApplicationRecord
    has_many :lendings
    has_many :reservations
    has_many :users, through: :reservations
    validates :title, presence: true
    validates :author, presence: true

end
