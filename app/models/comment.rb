class Comment < ActiveRecord::Base
  acts_as_mentioner
  acts_as_likeable
end
