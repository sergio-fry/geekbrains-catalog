# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  active      :boolean          default(TRUE), not null
#  description :text
#  order_index :integer          default(0), not null
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  validates :title, presence: true

  has_many :items
end
