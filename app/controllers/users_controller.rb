class UsersController < ApplicationController

before_action :baria_user, only:[:edit, :update]

  def show
     @user = User.find(params[:id])
     @books = Book.all
     @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
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




