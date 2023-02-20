class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  has_many :users_lendings, through: :lendings, source: :user
  has_many :users_reservations, through: :reservations, source: :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
