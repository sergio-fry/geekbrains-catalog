# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  children_count   :integer          default(0), not null
#  commentable_type :string
#  depth            :integer          default(0), not null
#  lft              :integer          not null
#  rgt              :integer          not null
#  text             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  parent_id        :integer
#  user_id          :integer
#
# Indexes
#
#  index_comments_on_commentable_id_and_commentable_type  (commentable_id,commentable_type)
#  index_comments_on_lft                                  (lft)
#  index_comments_on_parent_id                            (parent_id)
#  index_comments_on_rgt                                  (rgt)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
