class BooksController < ApplicationController
  def new
    @books = books.new
  end
  
  def create
    @books = books.new(post_image_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to post_images_path
  end

  def index
  end

  def show
  end

  def destroy
  end
  
  def edit
  end
   
end
