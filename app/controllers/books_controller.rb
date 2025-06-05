class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = @user.books
    @new_book = Book.new
  end
  
def create
  @book = current_user.books.new(book_params)
  if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
  else
    @books = Book.all
    @user = current_user
    render :index
  end
end
  

  def update
    @book = Book.find(params[:id])
    
    if @book.user != current_user
      redirect_to books_path
      return
    end
    
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: '本当に消しますか'
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
