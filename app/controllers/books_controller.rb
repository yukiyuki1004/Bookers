class BooksController < ApplicationController
  
  def top
  end
  
  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end
  
  def create
     @book =Book.new(book_params)
   if @book.save
     redirect_to book_path(@book.id)
     flash[:create] = "Book was successfully created."
   else
    render:index
   end
  end

  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = "Book was successfully update."
      redirect_to book_path(@book.id)
    else
      render:edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:destroy] = "Book was successfully destroyed. "
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
