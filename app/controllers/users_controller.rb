class UsersController < ApplicationController

before_action :baria_user, only:[:edit, :update]

  def show
     @user = User.find(params[:id])
     @book = Book.new
     #@books = Book.where(user_id: @user).includes(:user).order("created_at DESC")
     @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice:"update successfully!"
    else
    render :edit
    end

  end
end
private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end
def baria_user
    @book = User.find(params[:id])
     unless @book == current_user
     redirect_to user_path(current_user.id)
     end
 end




