class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
      return
    end
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
      return
    end
    
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end