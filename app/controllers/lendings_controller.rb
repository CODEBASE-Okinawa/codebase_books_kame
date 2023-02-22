class LendingsController < ApplicationController

    def index
         @lending_books = current_user.lendings.where(status: 0)  
    end

    def show
        @lending_books = current_user.lendings.where(book_id:params[:id], status:0).first
    end

    def new
        @lending_book = Lending.new
    end

    def create
        @lending_book = Lending.new(reservation_params)

        binding.irb
        if @lending_book.save
            redirect_to books_url, notice: "貸出完了"
        else
            render :show
        end
    end

    def edit
        current_user.lendings.where(book_id: params[:id], status: 0).first.update(status:1)
        redirect_to lendings_path, notice:"本を返却しました"
    end

    private
    def lending_params
        params.require(:reservation).permit(:user_id, :book_id, :reserved_start, :reserved_end)
    end

end
