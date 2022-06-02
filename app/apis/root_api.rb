class RootApi < Grape::API
  format :json

  mount ItemsApi
end
