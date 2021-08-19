class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @post_images = Book.all
  end
end
