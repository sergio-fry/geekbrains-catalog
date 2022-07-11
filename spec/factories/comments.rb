# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_type :string
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
#  index_comments_on_parent_id                            (parent_id)
#
FactoryBot.define do
  factory :comment do
    text { "MyText" }
    parent_id { 1 }
    commentable_type { "MyString" }
    commentable_id { 1 }
  end
end
