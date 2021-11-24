class BooksController < ApplicationController

  def new
    @book = book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save!
    redirect_to book_path(@book.id), notice: "successfully created book!"
    else
    @users = current_user  
    @books = Book.all
    render :index
    
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @users = User.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def edit
   @book = Book.find(params[:id])
   
  end
  def update
   book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path(book.id)
  end
  
   private
   
   def book_params
     params.require(:book).permit(:title, :body)
   end
  
end
