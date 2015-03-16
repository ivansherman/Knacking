class User < ActiveRecord::Base
  has_many :posts
  acts_as_inkwell_user
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
  acts_as_mentionable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
