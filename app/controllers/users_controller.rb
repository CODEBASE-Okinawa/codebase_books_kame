class UsersController < ApplicationController
  def index
    @users = User.where(status: 1)
    @lended_books = Lending.all

    redirect_to root_path if current_user.nil? || current_user.status == 1
  end
end
