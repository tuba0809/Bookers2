class BooksController < ApplicationController

  before_action :baria_user, only: [:edit, :destroy, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @users = @book.user
    @books = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
        flash[:notice] = "Edit successfully!"
     redirect_to book_path(@book.id)
     else
     render :edit
     end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  def baria_user
    unless Book.find(params[:id]).user.id.to_i == current_user.id
        redirect_to books_path
    end
 end
end
