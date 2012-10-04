class Book < ActiveRecord::Base
  attr_accessible :author, :name, :summary
  validates :author,  :presence => true
  validates :name, :presence => true,
                   :length => { :minimum => 5 }
  validates :summary, :presence => true,
                      :length => { :minimum => 5 }
  has_many :reviews
end
