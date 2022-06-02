class ItemsApi < Grape::API
  format :json

  resource :items do
    helpers ::Helpers::ItemHelpers

    desc "Get item"
    params do
      requires :id, type: Integer, desc: "Item ID."
    end
    route_param :id do
      get do
        ItemSerializer.new(item).as_json
      end
    end
  end
end
