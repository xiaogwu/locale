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

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
