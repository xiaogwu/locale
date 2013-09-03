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
  belongs_to :post, inverse_of: :comments
  belongs_to :user

  validates_presence_of :text, :post
end
