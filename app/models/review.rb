class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  attr_accessible :author, :body, :grade
end
