class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lendings
  has_many :lending_books, through: :lendings, source: :book
  has_many :reservations
  has_many :reservation_books, through: :reservations, source: :book 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
