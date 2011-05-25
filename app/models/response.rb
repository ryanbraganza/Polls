class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
end
