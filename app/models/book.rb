class Book < ActiveRecord::Base
  attr_accessible :author, :resume, :title
  attr_accessor :rating
  validates :author,  :presence => true
  validates :resume, :presence => true, :length => { :minimum => 50 }
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :reviews
  
  def show
  bookid = params[:id]
  @book = Book.find(bookid)
 
  rtg = 0
  # Fetching all the reviews associated to the book
  @reviews = Review.find(:conditions => ["book_id = ?", bookid])   
  # Computing the rating
  @reviews.each do |review|
  	rtg += review.grade
  end
  @rating = rtg / @reviews.size 
  	respond_to do |format|
    	format.html  # book.html.erb
    	format.json  { render :json => @post }
  	end
  end
  
end
