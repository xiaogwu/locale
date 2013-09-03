# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text(700)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :delete_all, inverse_of: :post

  validates_presence_of :body
 end
