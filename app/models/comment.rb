class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll
  validates_presence_of :created_at
  validates_presence_of :user
  validates_presence_of :poll
  validates_presence_of :comment

  default_scope :order => 'created_at desc'
end
