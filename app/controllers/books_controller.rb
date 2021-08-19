class BooksController < ApplicationController
  def new
    @post_image = Book.new
  end

  def create
    @post_image = Book.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = Book.all
  end

  def show
    @post_image = Book.find(params[:id])
  end

  def destroy
    def destroy
    @post_image = Book.find(params[:id])
    @post_image.destroy
    redirect_to books_path
    end
  end

   private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
