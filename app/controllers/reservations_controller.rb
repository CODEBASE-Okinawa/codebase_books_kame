class ReservationsController < ApplicationController

  def index
      @reservation_books = current_user.reservations.where(status: 0).order(:reserved_start)
  end

  def show
    @reservation_book = current_user.reservations.where(book_id:params[:id], status:0).first
  end

  def create
    if !current_user.nil?
      @reservation_book = Reservation.new(reservation_params(params))
      
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
    current_user.reservations.where(book_id: params[:id], status: 0).first.destroy
    redirect_to reservations_path, notice:"予約を取り消しました"
  end

  private
  def reservation_params(data)
      @reservation_books = {user_id: current_user.id, book_id: data[:book_id], reserved_start: data[:reserved_start], reserved_end: data[:reserved_end]}
  end
end
