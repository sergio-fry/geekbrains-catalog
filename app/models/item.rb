class Item < ApplicationRecord
  validates :title, presence: true
  belongs_to :category

  def category_title
    category.title
  end
end
