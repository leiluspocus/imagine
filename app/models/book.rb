class Book < ActiveRecord::Base
  attr_accessible :author, :resume, :title
  
  validates :author,  :presence => true
  validates :resume, :presence => true
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
  
end
