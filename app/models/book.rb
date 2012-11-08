class Book < ActiveRecord::Base
  attr_accessible :author, :resume, :title 
  
  validates :author,  :presence => true
  validates :resume, :presence => true, :length => { :minimum => 50 }
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  has_many :reviews
   
  # Return the average rating of a book
  def rating 
  	rtg = 0
  	# Fetching all the reviews associated to the book
  	@reviews = Review.all(:conditions => ["book_id = ?", id])   
  	# Computing the rating
  	@reviews.each do |review|
  		rtg += review.grade
  	end
  	rtg = rtg / @reviews.size 
  	return rtg
  end
  
  def show 
  @book = Book.find(params[:id])
  	respond_to do |format|
    	format.html  # book.html.erb
    	format.json  { render :json => @post }
  	end
  end
   
end
