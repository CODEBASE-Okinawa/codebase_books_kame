class BooksController < ApplicationController
    # ユーザーと管理者のコントローラーです。

    def index
    end
    
    def show
      @book = Book.find(params[:id])
    end

    def new
      @book = Book.new
    end

    def create
      book = Book.new(book_params)
      #登録が成功したら一覧へ、失敗したらフォームをリダイレクトさせる。
      if book.save!
          redirect_to books_url, notice: "「#{book.title}」を登録しました。"
      else
          render :new, alert: "入力が間違っています。"
      end

    end

    def edit
    end



    private

    # strong_parameters,,,登録画面でハッシュの内容をそのまま送らないようにしている。
    def book_params
        # stockカラムを追加したら修正する
        params.require(:book).permit(:title, :author)
    end
    
end
