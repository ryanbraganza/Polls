class Question < ActiveRecord::Base
  belongs_to :poll

  has_many :answers
  has_many :responses, :through => :answers
end
