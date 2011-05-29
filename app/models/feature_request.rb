class FeatureRequest < ActiveRecord::Base
  belongs_to :user

  attr_accessible :feature
  
  validates_presence_of :feature
  validates_presence_of :user
  validates_presence_of :created_at

  default_scope :order => 'created_at desc'
end
