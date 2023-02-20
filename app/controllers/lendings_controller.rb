class LendingsController < ApplicationController

    def index
        # ログインしたユーザーの借りている本を表示させる
         @lending_books = current_user.lendings.where(status: 0)
         
    end

    def show
        @lending_books = current_user.lendings.where(book_id:params[:id], status:0).first
    end

    def new
       
    end

    def create
        user_id = current_user.id
        book_id = params[:id]
        status = 1234
        # return_date = Data.today+7

        lending = Lending.new(lending_params)
        if lending.save
            redirect_to books_url, notice: "貸出完了"
        else
            render :new
        end
        binding.irb
    end

    def edit
        current_user.lendings.where(book_id: params[:id], status: 0).first.update(status:1)
        redirect_to lendings_path, notice:"本を返却しました"
    end

    private
    def lending_params
        params.require(:lending).permit(:user_id, :book_id,  :lend_date)
    end
end
