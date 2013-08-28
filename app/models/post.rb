class Post < ActiveRecord::Base
  has_many :comments, as :commentable

  validates_presence_of :body
end
