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
class ItemSerializer < Grape::Entity
  expose :title
  expose :price

  expose :category_title

  def category_title
    object.category.title
  end
end
