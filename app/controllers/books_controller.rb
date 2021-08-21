class BooksController < ApplicationController
  def new
    @post_image = Book.new
  end

  def create
    @post_image = Book.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      flash[:notice] = "Book was successfully created."
      redirect_to books_path
    else
    render :new
    end
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
    params.require(:book).permit(:shop_name, :image, :caption)
  end
end
