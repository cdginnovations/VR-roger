class Course < ActiveRecord::Base
  has_many :topics
  has_many :lessons, :through => :topics
end
