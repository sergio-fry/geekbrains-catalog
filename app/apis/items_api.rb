class ItemsApi < Grape::API
  format :json

  resource :items do
    helpers ::Helpers::ItemHelpers

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    desc 'Items list'
    get do
      # authenticate!
      present Item.all, with: ItemSerializer
    end

    desc 'Get item'
    params do
      requires :id, type: Integer, desc: 'Item ID.'
    end
    route_param :id do
      get do
        # authenticate!
        ItemSerializer.new(item)
      end
    end
  end
end
