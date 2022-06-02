require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      title: "MyString",
      category_id: 1,
      price: 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "input[name=?]", "item[category_id]"

      assert_select "input[name=?]", "item[price]"
    end
  end
end
