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
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, class_name: "Comment", required: false
  has_many :children, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
  belongs_to :user
end
