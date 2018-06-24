class Question < ApplicationRecord
  # validations
  validates_presence_of :content, :answer
end
