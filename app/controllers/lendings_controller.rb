class LendingsController < ApplicationController

    def index
        # ログインしたユーザーの借りている本を表示させる
        @lending_books = current_user.lendings.where(status: 0)
        
    end

    def show
        @reservation_books = current_user.lendings.where(book_id:params[:id], status:0).first
        @lending_book = current_user.lendings.where(book_id:params[:id], status:0).first
    end

    def create
        if !current_user.nil?
            @lending_book = Lending.new(lending_params(params))
            if @lending_book.save
                redirect_to lendings_url, notice: "貸出完了"
            else
                render :show
            end
        else
            redirect_to new_user_session_path
        end
    end

    def edit
        current_user.lendings.where(book_id: params[:id], status: 0).first.update(status:1)
        redirect_to book_path, notice:"本を返却しました"
    end

    private
    def lending_params(data)
        @lending_books = {user_id: current_user.id, book_id: data[:book_id], lend_date: data[:reserved_start], return_date: data[:reserved_end]}
    end

end
