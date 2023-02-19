class LendingsController < ApplicationController

    def index
        # ログインしたユーザーの借りている本を表示させる
        @books = current_user.books
        
    end

    def show

    end

    def new
        @lending = Lending.new
    end

    def create
        lending = Lending.new(lending_params)
        if lending.save!
            redirect_to books_url, notice: "貸出完了"
        else
            # render :new
            redirect_to books_url
        end
    end


    private
    def lending_params
        params.require(:lending).permit(:lend_date)
    end
end
