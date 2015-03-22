class Comment < ActiveRecord::Base
  belongs_to :profile
  belongs_to :user
  acts_as_mentioner
  acts_as_likeable
end
