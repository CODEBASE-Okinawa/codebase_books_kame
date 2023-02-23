class LendingsController < ApplicationController

    def index
         @lending_books = current_user.lendings.where(status: 0)  
    end

    def show
        @lending_books = current_user.lendings.where(book_id:params[:id], status:0).first
    end

    def create
    
        @lending_book = Lending.new(lending_params(params))
       
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
    def lending_params(data)
        @lending_books = {user_id: data[:user_id], book_id: data[:book_id], lend_date: data[:reserved_start], return_date: data[:reserved_end]}
    end

end
