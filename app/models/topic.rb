class Topic < ActiveRecord::Base
  belongs_to :instructor, class_name: 'User'

  has_many :topic_lessons
  has_many :lessons, through: :topic_lessons

  has_many :course_topics
  has_many :courses, through: :course_topics
end
