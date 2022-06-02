class ItemsApi < Grape::API
  format :json

  resource :items do
    helpers ::Helpers::ItemHelpers

    desc "Items list"
    get do
      present Item.all, with: ItemSerializer
    end

    desc "Get item"
    params do
      requires :id, type: Integer, desc: "Item ID."
    end
    route_param :id do
      get do
        ItemSerializer.new(item)
      end
    end
  end
end
