class HomeController < ApplicationController
  def index
    @categories = Category.all
    @stats = Stats.new
  end
end
