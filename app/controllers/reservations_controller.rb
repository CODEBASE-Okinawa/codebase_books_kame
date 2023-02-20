class ReservationsController < ApplicationController

  def index
    @reservation_books = current_user.reservations.where(status: 0)
  end

  def reserve
  end

  def show
    @reservation_book = current_user.reservations.where(book_id:params[:id], status:0).first
  end

  def edit
    current_user.reservations.where(book_id: params[:id], status: 0).first.update(status:1)
    redirect_to reservations_path, notice:"予約を取り消しました"
  end
end
