class ReservationsController < ApplicationController

  def index
    @reservation_books = current_user.books.where(reservations:{status:0})
  end

  def reserve
  end

  def show
  end
end
