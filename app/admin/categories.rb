ActiveAdmin.register Category do
  menu priority: 5

  show do
    attributes_table_for resource do
      row :id
      row :title
      row :description
    end

    panel "Items" do
      resource.items.each do |item|
        div item.title
      end
    end
  end
end
