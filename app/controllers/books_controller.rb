class BooksController < ApplicationController
    before_action :authenticate_user!#, except: [:index]
	def new
		@book=Book.new
	end

	def index
		@books=Book.all
	end 

	def create
		@book=Book.new(book_params)
	   if @book.save
		redirect_to @book
	   else 
	   end
	end 

	def show
        @book = Book.find(params[:id]) 
    end

    def edit
    	@book = Book.find(params[:id])
    end


    def update  
       @book = Book.find(params[:id])
     if @book.update(book_params)
        redirect_to @book
        else
        render 'edit'
     end
    end

	private
    def book_params
        params.require(:book).permit(:title, :text)
    end
end
