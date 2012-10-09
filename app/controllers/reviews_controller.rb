class ReviewsController < ApplicationController

  # Create a review
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(params[:review])
    redirect_to book_path(@book)
  end
  
  # Remove a review
  def destroy
    @book = Book.find(params[:book_id])
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to book_path(@book)
  end
 
 
end
