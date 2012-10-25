class User < ActiveRecord::Base
  attr_accessible :birthdate, :email, :name
end
