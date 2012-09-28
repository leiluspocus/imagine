class Book < ActiveRecord::Base
  attr_accessible :author, :name, :summary
end
