module Helpers
  module ItemHelpers
    def item
      Item.find(params[:id])
    end
  end
end
