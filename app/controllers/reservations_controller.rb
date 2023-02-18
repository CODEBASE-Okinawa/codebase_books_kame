class ReservationsController < ApplicationController

  def index
    @books = current_user.books
  end

  def reserve
  end

  def show
  end
end
