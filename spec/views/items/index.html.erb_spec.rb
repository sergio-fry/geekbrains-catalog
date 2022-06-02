require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        title: "Title",
        category_id: 2,
        price: 3
      ),
      Item.create!(
        title: "Title",
        category_id: 2,
        price: 3
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
