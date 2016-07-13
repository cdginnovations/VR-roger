class LessonPrompt < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :prompt
  accepts_nested_attributes_for :lesson
end
