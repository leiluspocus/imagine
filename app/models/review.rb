class Review < ActiveRecord::Base
  belongs_to :book
  attr_accessible :author, :body
end
