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
  has_many :order_items
  has_many :orders, through: :order_items

  after_update -> { orders.each(&:touch) }

  def new_image
  end

  def new_image=(file)
    images.attach file
  end
end
