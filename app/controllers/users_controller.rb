class UsersController < ApplicationController
   
   def show
    @book = Book.new
    @users = User.find(params[:id])  
    @books = @users.books
   end
   
   def index
     @user = User.all  
     @book = Book.new
     @users = current_user
   end
      
   def edit
     @user = User.find(params[:id])
   end 
   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice:"Welcome! You have signed up successfully"
   end
    private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
