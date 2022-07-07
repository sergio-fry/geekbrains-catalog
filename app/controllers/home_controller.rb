class HomeController < ApplicationController
  def index
    @categories = Category.order(:id).page(params[:page])
    @stats = CachedStats.new
  end
end
