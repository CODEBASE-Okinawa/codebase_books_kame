class BooksController < ApplicationController
  # ユーザーと管理者のコントローラーです。

  def index
    @books = Book.all

    # @lending_books = current_user.lendings.where(status: 0) unless current_user.nil?
    # @reservation_books = current_user.reservations.where(status: 0) unless current_user.nil?

    # return if current_user.nil?

    @lending_books = Lending.where(status: 0)
    @reservation_books = current_user.reservations.where(status: 0) unless current_user.nil?
    @reserved_books = Reservation.where("reserved_end <= ?", Date.yesterday)
    @reserved_books.destroy_all
  end

  def show
    @lendings_status = Lending.all.where(status:0, book_id:params[:id])
    @reservation_status = Reservation.all.where(status:0, book_id:params[:id])
    @book = Book.find(params[:id])
    @lending_book = Lending.where(user_id: current_user.id, book_id: @book,status: 0).first unless current_user.nil?
    @reservation_book = Reservation.where(user_id: current_user.id, book_id: @book, status: 0).first unless current_user.nil?
        if !current_user.nil? && !@lending_book.nil?
          redirect_to lending_path
        elsif !current_user.nil? && !@reservation_book.nil?
          redirect_to reservation_path
        end
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
