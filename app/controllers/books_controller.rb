class BooksController < ApplicationController
  # ユーザーと管理者のコントローラーです。

  def index
    @books = Book.all

    # @lending_books = current_user.lendings.where(status: 0) unless current_user.nil?
    # @reservation_books = current_user.reservations.where(status: 0) unless current_user.nil?

    # return if current_user.nil?

    @lending_books = Lending.where(status: 0)
    @reservation_books = current_user.reservations.where(status: 0) unless current_user.nil?
  end

  def show
    @book = Book.find(params[:id])
    # @reservation = Reservation.new
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    # 登録が成功したら一覧へ、失敗したらフォームをリダイレクトさせる。
    if book.save!
      redirect_to books_url, notice: "「#{book.title}」を登録しました。"
    else
      render :new, alert: "入力が間違っています。"
    end
  end

  def edit
    redirect_to books_url
  end

  # 本を借りるアクション
  def lend
    redirect_to books_url
  end

  # 本を予約するアクション
  def reserve
    redirect_to books_url
  end

  private

  # strong_parameters,,,登録画面でハッシュの内容をそのまま送らないようにしている。
  def book_params
    # stockカラムを追加したら修正する
    params.require(:book).permit(:title, :author, :image)
  end
end
