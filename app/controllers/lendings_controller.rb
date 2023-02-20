class LendingsController < ApplicationController

    def index
        # ログインしたユーザーの借りている本を表示させる
        # @books = current_user.books
        
    end

    def show
        @lending = Lending.new
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


    private
    def lending_params
        params.require(:lending).permit(:user_id, :book_id,  :lend_date)
    end
end
