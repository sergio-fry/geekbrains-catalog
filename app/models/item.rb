# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  price       :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
class Item < ApplicationRecord
  validates :title, presence: true
  belongs_to :category

  has_many_attached :images

  def new_image
  end

  def new_image=(file)
    images.attach file
  end
end
