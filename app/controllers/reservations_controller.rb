class ReservationsController < ApplicationController

  def index
      @reservation_books = current_user.reservations.where(status: 0)
  end

  def show
    @reservation_book = current_user.reservations.where(book_id:params[:id], status:0).first
  end

  def create
    if !current_user.nil?
      @reservation_book = Reservation.new(reservation_params)
      
      if @reservation_book.save
          redirect_to reservations_path, notice: "予約完了"
      else
          render :new
      end
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    current_user.reservations.where(book_id: params[:id], status: 0).first.update(status:1)
    redirect_to reservations_path, notice:"予約を取り消しました"
  end

  private
  def reservation_params
      params.permit(:user_id, :book_id, :reserved_start, :reserved_end)
  end
end
