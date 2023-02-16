class Book < ApplicationRecord
    has_many :lendings
    has_many :reservations
    validates :title, presence: true
    validates :author, presence: true

end
