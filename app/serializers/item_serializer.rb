class ItemSerializer < Grape::Entity
  expose :title
  expose :price

  expose :category_title

  def category_title
    object.category.title
  end
end
