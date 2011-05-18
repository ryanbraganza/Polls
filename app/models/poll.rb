class Poll < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'

  has_many :questions

  validates_presence_of :creator
end
