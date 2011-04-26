class Poll < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'

  validates_presence_of :creator
end
