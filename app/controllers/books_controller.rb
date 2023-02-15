class BooksController < ApplicationController
  # ユーザーと管理者のコントローラーです。

  def index
    @books = Book.all
    # @title = books[0][:title]
    # @image = books[0][:image]
    # @author = books[0][:author]


  end

  def show
  end

  def new
  end

  def edit
  end
end
