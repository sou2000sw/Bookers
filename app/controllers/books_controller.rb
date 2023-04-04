class BooksController < ApplicationController
  def new
  end
  
  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      flash[:alret] = "not saved due to error"
      redirect_to "/books"
    end
  end

  def index
    @book = Book.new
    @lists = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @lists = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      flash[:alrate] = "not saved due to error"
      redirect_to edit_book_path(book.id)
    end
  end
  
  def destroy
    list = Book.find(params[:id])
    list.destroy
    redirect_to "/books"
  end
  
  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
