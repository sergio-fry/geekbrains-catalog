# frozen_string_literal: true
ActiveAdmin.register_page "Stats" do
  content do
    table do
      tr do
        th "Categories"
        td Category.count
      end

      tr do
        th "Items"
        td Item.count
      end

      tr do
        th "Users"
        td User.count
      end
      
    end
  end
end
