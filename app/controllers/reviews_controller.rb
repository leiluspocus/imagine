class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(params[:review])
    redirect_to book_path(@book)
  end
end
