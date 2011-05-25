class Answer < ActiveRecord::Base
  belongs_to :question
  default_scope :order => '"index"'
  has_many :responses
end
