class BooksController < ApplicationController

  def new
    @book = book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice: "successfully created book!"
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
  end

  def destroy
  end
  
  def edit
  end
   private
   
   def book_params
     params.require(:book).permit(:title, :body)
   end
  
end
