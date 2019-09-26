class BooksController < ApplicationController

def index # Hidden Code
   def create
    if book.save
      render serialize(book).merge(status: :created, location: book)
	    else
	      unprocessable_entity!(book)
	    end
  	end

   def update
    if book.update(book_params)
      render serialize(book).merge(status: :ok)
	    else
	      unprocessable_entity!(book)
	    end
	end

    def destroy
	    book.destroy
	    render status: :no_content
  	end

  private

  def book # Hidden Code

  def book_params
    params.require(:data).permit(:title, :subtitle, :isbn_10, :isbn_13,
                                 :description, :released_on, :publisher_id,
                                 :author_id, :cover)
  end
end