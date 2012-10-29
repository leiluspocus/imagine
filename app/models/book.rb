class Book < ActiveRecord::Base
  attr_accessible :author, :resume, :title
  
  validates :author,  :presence => true
  validates :resume, :presence => true, :length => { :minimum => 50 }
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :reviews
  
  def show
  @book = Book.find(params[:id])
 
  	respond_to do |format|
    	format.html  # book.html.erb
    	format.json  { render :json => @post }
  	end
  end
  
  def computeRating
#  rating = 0;
#  reviews = Review.where(:book=>self);
#  	reviews.each do |rev|
#  		rating += rev.grade;
#  	end
#  return rating/reviews.length
	return 5
  end
  
end
