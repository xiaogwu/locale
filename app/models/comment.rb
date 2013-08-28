# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  text             :text(300)
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable

  validates_presence_of :text, :commentable
end
