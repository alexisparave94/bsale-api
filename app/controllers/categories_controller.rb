class CategoriesController < ApplicationController
  def index
    @categories = @bsale_service.list_categories
    render json: @categories
  end
end
